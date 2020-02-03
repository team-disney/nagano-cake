class Admin::OrdersController < ApplicationController
    def index
        @orders = Order.all
        
        @filtered_orders = Order.where(order_id: @Order)

    end

    def update
        @order = Order.find(params[:id])
        if @order.update(order_params)
            redirect_to admin_order_path(@order)
        else
            render :show
        end

        # @order_detail = OrderDetail.find(params[:id])
        # if @order_detail.update(order_detail_params)
        #     redirect_to admin_order_path(@order_detail), notice: "製作ステータスを更新しました！"
        # else
        #     render :show
        # end
    
    end

    def show
        @order = Order.find(params[:id])
        @order_details = @order.order_details
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