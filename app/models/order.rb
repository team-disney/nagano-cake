class Order < ApplicationRecord
     enum status:{wait:0,check:1,making:2,beforeship:3,shipping:4}  
end