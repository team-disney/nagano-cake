class Order < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :end_user
  has_many :order_details
end
