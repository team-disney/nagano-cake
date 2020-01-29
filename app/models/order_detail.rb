class OrderDetail < ApplicationRecord
  belongs_to :order
  
  enum status:{inpossible:0,wait:1,making:2,dome:3}  
end