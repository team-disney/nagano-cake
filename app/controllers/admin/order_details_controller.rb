class Admin::OrderDetailsController < ApplicationController
    def update
        @order = OrderDetail.find(params[:id])
        if @order.update(order_detail_params)
            redirect_to admin_order_path(@order)
        else
            render :show
        end
    end
    private
    def order_detail_params
        params.require(:order_detail).permit(:production_status)
    end
end


