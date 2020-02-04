class Item < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :genre
  has_many :cart_items
  
  # ITEM HAS IMAGE ATTACHMENT
  attachment :image

  # VALIDATES
  validates :name, presence:true, length: { maximum: 30 }
  validates :caption, presence:true, length: { maximum: 1000 }
  validates :price, presence:true, numericality: { only_integer: true }
  validates :genre_id, presence:true, numericality: { only_integer: true }
  validates :status, presence:true

  # ENUM STATUS
  enum status: {
                  "販売停止中": 0,
                  "販売中": 1,
  }

  # PRICE * TAX
  def tax_price
    tax = 0.1
    self.price + (price * tax).to_i
  end

end
