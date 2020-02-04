class Order < ApplicationRecord
  # ASSOCIATIONS  
  belongs_to :end_user
  has_many :order_details, dependent: :destroy

  # SAVE WITH CHILDREN
  accepts_nested_attributes_for :order_details

  # ORDER=STATUS ENUM
  enum status: {
                  "入金待ち": 0,
                  "入金確認": 1,
                  "製作中": 2,
                  "発送準備中": 3,
                  "発送中": 4,
  }

  # VARIDATIONS

end
