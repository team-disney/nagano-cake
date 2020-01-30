class Genre < ApplicationRecord
  # ASSOCIATIONS
  has_many :items
  
  #ジャンルステータスのenum管理
  enum status: { "無効": 0, "有効": 1 }

  #ジャンル名の空欄登録を無効化
  validates :name, presence:true
end
