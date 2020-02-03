class CartItem < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :end_user
  belongs_to :item

  #支払い方法のenum管理
  enum payment_method: { "銀行振込": 0, "クレジットカード": 1 }

end
