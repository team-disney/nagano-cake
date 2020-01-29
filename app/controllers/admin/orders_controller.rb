class Admin::OrdersController < ApplicationController
  def index
      @orders = Order.all
      # s
  end

  def update
      @admin_order = Order.find(params[:id])
      @order.update(admin_order_params)
  end
  end

  
  def show
      @order_detail = Order_detail.find(params[:id])
  end
  def change
      create_table :articles do |t|
      t.integer :status, default: 0, null: false, limit: 1
      t.timestamps null: false
  end
      add_show :articles, :status
  end
end