class CartItemsController < ApplicationController
  before_action :authenticate_end_user!
  
  # INDEX PAGE LOAD
  def index
    # CURRENT USER CART ITEMS
    @current_user_cart_items = current_end_user.cart_items
    @cart_items = CartItem.all

    # CART-ITEMS SUM-PRICE
    @cart_items_sum_price = 0
    @current_user_cart_items.each do |cart_item|
      @cart_items_sum_price += cart_item.item.tax_price * cart_item.amount
    end

    # IS CART EMPTY ?
    if @current_user_cart_items.size == 0
      @is_cart_empty_desabled = "disabled"
    end
  end

  # INPUT PAGE LOAD
  def input
    # PAYMENT-METHODS ENUM TO ARRAY
    # @arrayed_payment_methods = CartItem.payment_methods.keys.to_a
  end

  # CREATE CART SESSION
  def create_cart_session

    # REJECT NILL
    if cart_params[:payment_method] == nil
      flash[:alert] = "お支払い方法を選択してください"
      render :input
    end

    if cart_params[:send_method] == nil
      flash[:alert] = "配送先を選択してくださgい"
      render :input
    end

    if cart_params[:send_method] == "new_address"
      if cart_params[:new_zipcode] == nil
        flash[:alert] = "新しい配送先の郵便番号を入力してください"
        render :input
      end
      if cart_params[:new_address] == nil
        flash[:alert] = "新しい配送先の住所を入力してください"
        render :input
      end
      if cart_params[:new_name] == nil
        flash[:alert] = "新しい配送先の名前を入力してください"
        render :input
      end
    end

    # INITIALIZE SESSION
    cart_session = {
      selected_payment_method: "",
      selected_send_method: "",
      selected_sub_address_id: 0,
      new_address: { zipcode: "", address: "", name: "" },
      shipping_price: 800,
    }

    # PUT SESSION-VALIABLE: PAYMENT METHOD
    if cart_params[:payment_method] == "credit_card"
      cart_session[:selected_payment_method] = cart_params[:payment_method]
    elsif cart_params[:payment_method] == "bank_transfer"
      cart_session[:selected_payment_method] = cart_params[:payment_method]
    end

    # PUT SESSION-VALIABLE: SEND METHOD
    if cart_params[:send_method] == "main_address"
      cart_session[:selected_send_method] = cart_params[:send_method]
    elsif cart_params[:send_method] == "sub_address"
      cart_session[:selected_send_method] = cart_params[:send_method]
      cart_session[:selected_sub_address_id] = cart_params[:sub_address_id]
    elsif cart_params[:send_method] == "new_address"
      cart_session[:selected_send_method] = cart_params[:send_method]
      cart_session[:new_address][:zipcode] = cart_params[:new_zipcode]
      cart_session[:new_address][:address] = cart_params[:new_address]
      cart_session[:new_address][:name] = cart_params[:new_name]
    end

    # SAVE SESSION-VALIABLE TO SESSION
    session[:cart_session] = cart_session
    redirect_to cart_item_display_path
  end

  # DISPLAY
  def display
    @current_user_cart_items = current_end_user.cart_items

    # CART-ITEMS PRE-SUM-PRICE
    @cart_items_sum_price = 0
    @current_user_cart_items.each do |cart_item|
      @cart_items_sum_price += cart_item.item.tax_price * cart_item.amount
    end

    # FROM SESSION
    cart_session = session[:cart_session]
    # DISPLAY PAYMENT-VARIABLE
    if cart_session["selected_payment_method"] == "credit_card"
      @decided_payment_method = "クレジットカード"
    elsif cart_session["selected_payment_method"] == "bank_transfer"
      @decided_payment_method = "銀行振込"
    else
      @decided_payment_method = "PAYMENT METHOD ERROR!"
    end
    # DISPLAY SEND-ADDRESS-VARIABLE
    if cart_session["selected_send_method"] == "main_address"
      @decided_send_address = current_end_user.address
      @decided_send_address =  "〒 #{current_end_user.zipcode[0..2]}-#{current_end_user.zipcode[3..6]} #{current_end_user.address} #{current_end_user.last_name} #{current_end_user.first_name}"
    elsif cart_session["selected_send_method"] == "sub_address"
      @decided_send_address = current_end_user.addresses.find(cart_session["selected_sub_address_id"].to_i).input_view_address
    elsif cart_session["selected_send_method"] == "new_address"
      new_zipcode = cart_session["new_address"]["zipcode"]
      new_address = cart_session["new_address"]["address"]
      new_name = cart_session["new_address"]["name"]
      @decided_send_address = "〒 #{new_zipcode[0..2]}-#{new_zipcode[3..6]} #{new_address} #{new_name}"
    else
      @decided_send_address = "ADDRESS ERROR!!"
    end

    # DISPLAY SHIPPING-PRICE
    @shipping_price = cart_session["shipping_price"]
  end

  def thanks
  end

  # UPDATE --- CART ITEM AMOUNT
  def update
    cart_item = CartItem.find(params[:id])
    if cart_item.update(edit_item_amount_params)
      redirect_to cart_items_path
    end
  end

  # CART CLEAR ONE
  def destroy
    cart_item = CartItem.find(params[:id])
    cart_item.destroy
    redirect_to cart_items_path
  end

  # CART CLEAR ALL
  def destroy_all
    current_end_user.cart_items.destroy_all
    redirect_to cart_items_path
  end

  private

  def cart_params
    params.permit(:payment_method, :send_method, :sub_address_id, :new_zipcode, :new_address, :new_name)
  end

  def edit_item_amount_params
    params.require(:cart_item).permit(:amount)
  end
end
