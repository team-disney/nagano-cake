class Item < ApplicationRecord
  # ITEM HAS IMAGE ATTACHMENT
  attachment :image
  enum status: {
                  "販売停止中": 0,
                  "販売中": 1,
  }
end
