class OrdersController < ApplicationController
  def index
    @current_user_orders = current_end_user.orders
  end

  def show
    @order = Order.find(params[:id])
    # CURRENT USER CHECK
    if !(current_end_user == @order.end_user)
      redirect_to root_path
    end
  end

  # REGISTER DECIDED-ORDER FROM SESSIONS
  def create

    # SESSION ERROR
    if !session[:cart_session].any?
      error = "THERE IS NO SESSIONS!"
      redirect_to cart_items_path, alert: error
    end

    # NEED TO SAVE DOWNBELOW
    # > end_user_id
    # > name
    # > zipcode
    # > address
    # > status
    # > sum_price
    # > shipping_price
    # > payment_price
    # > payment_method

    # READ SESSION
    cart_session = session[:cart_session]

    # PUT TO VARIABLES
    decided_order = Order.new
    # PUT END_USER ID
    decided_order.end_user_id = current_end_user.id.to_i
    # PUT NAME-ZIPCODE-ADDRESS
    if cart_session["selected_send_method"] == "main_address"
      decided_order.name = "#{current_end_user.last_name} #{current_end_user.first_name}".to_s
      decided_order.zipcode = current_end_user.zipcode.to_i
      decided_order.address = current_end_user.address.to_s
    elsif cart_session["selected_send_method"] == "sub_address"
      decided_order.name = current_end_user.addresses.find(cart_session["selected_sub_address_id"].to_i).name.to_s
      decided_order.zipcode = current_end_user.addresses.find(cart_session["selected_sub_address_id"].to_i).zipcode.to_i
      decided_order.address = current_end_user.addresses.find(cart_session["selected_sub_address_id"].to_i).address.to_s
    elsif cart_session["selected_send_method"] == "new_address"
      decided_order.name = cart_session["new_address"]["name"].to_s
      decided_order.zipcode = cart_session["new_address"]["zipcode"].to_i
      decided_order.address = cart_session["new_address"]["address"].to_s
    end

    # IF USE NEW-ADDRESS? SAVE IT
    if cart_session["selected_send_method"] == "new_address"
      new_address = Address.new
      new_address.end_user_id = current_end_user.id
      new_address.name = cart_session["new_address"]["name"].to_s
      new_address.zipcode = cart_session["new_address"]["zipcode"].to_i
      new_address.address = cart_session["new_address"]["address"].to_s
      if new_address.save
        @notice_message = "新規配送先に #{new_address.name} さんを追加しました。"
      end
    end

    # PUT ORDER-STATUS
    decided_order.status = 0 # DEFAULT ["入金待ち": 0]

    # CART-ITEMS SUM-PRICE --- !
    cart_items_sum_price = 0
    current_user_cart_items = current_end_user.cart_items
    current_user_cart_items.each do |cart_item|
      cart_items_sum_price += cart_item.item.tax_price * cart_item.amount
    end

    # PUT TO PRICES
    decided_order.sum_price = cart_items_sum_price.to_i
    decided_order.shipping_price = cart_session["shipping_price"].to_i
    decided_order.payment_price = decided_order.sum_price + decided_order.shipping_price

    # PUT PAYMENT-METHOD
    if cart_session["selected_payment_method"] == "credit_card"
      decided_order.payment_method = 0
    elsif cart_session["selected_payment_method"] == "bank_transfer"
      decided_order.payment_method = 1
    else
      decided_order.payment_method = nil
    end

    # PUT CART-ITEMS
    # ORDER-DETAIL BUILDS
    current_end_user.cart_items.each do |cart_item|
      decided_order.order_details.build(
        item_name: cart_item.item.name,
        amount: cart_item.amount,
        price: cart_item.item.tax_price,
        production_status: 0, # mean "着手不可"
      )
    end

    # SAVE TO ORDER WITH ORDER-DETAIL!!!
    if decided_order.save
      # CART-SESSION / VARIABLE / CART-ITEMS CLEAR!
      session[:cart_session].clear
      decided_order = nil
      current_end_user.cart_items.destroy_all

      # REDIRECT TO THANKS!
      if @notice_message
        flash[:notice] = @notice_message
      end
      redirect_to cart_item_thanks_path
    else
    end
  end

  private

  # ??? 使ってない
  def order_params
    params.require(:order).permit(:status)
  end
end
