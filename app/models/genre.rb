class Genre < ApplicationRecord
  
  enum status: { invalid: 0, valid: 1 }

end
