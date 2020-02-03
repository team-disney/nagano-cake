class Order < ApplicationRecord
    belongs_to :end_user
    has_many :order_details

    accepts_nested_attributes_for :order_details

    enum status:{"入金待ち":0,"入金確認":1,"製作中":2,"発送準備中":3,"発送中":4}
    
    def total_price
		order.sum_price
    end

    Order.all.sum(:payment_price)
end