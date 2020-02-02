class OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def show
      @order = Order.find(params[:id])
  end

  def create
      # (cart_items#displayから受け取った)特定のオーダーをdbへ保存する+ reset session  →その後redirect_to cart_items/:id/thanks
  end

  private
  def order_params
      params.require(:order).permit(:status)
        # params.require(:order).permit(:status, order_detail_attributes: [:production_status])
        # accepts_nested_attributes_for :order_details
  end

    # def order_detail_params
    #     params.require(:order_detail).permit(:production_status)
    # end
end
