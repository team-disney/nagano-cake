class OrderDetail < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :order

  # PRODUCTION-STATUS ENUM
  enum production_status: {
    "着手不可": 0,
    "製作待ち": 1,
    "製作中": 2,
    "製作完了": 3,
  }

  # VARIDATIONS
end
