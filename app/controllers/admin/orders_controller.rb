class Admin::OrdersController < ApplicationController
  def index
      @orders = Order.all
  end

  def update
      @order = Order.find(params[:id])
      @order.update(admin_order_params)
  end

  def show
      @order = Order.find(params[:id])
      @order_detail = @order.order_detail

  end
  def change
      create_table :articles do |t|
      t.integer :status, default: 0, null: false, limit: 1
      t.timestamps null: false
  end
      add_show :articles, :status
  end
end
