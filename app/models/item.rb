class Item < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :genre
  has_many :cart_items
  
  # ITEM HAS IMAGE ATTACHMENT
  attachment :image

  # ENUM STATUS
  enum status: {
                  "販売停止中": 0,
                  "販売中": 1,
  }
end
