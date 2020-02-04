class CartItem < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :end_user
  belongs_to :item

end
