class Address < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :end_user

  # 購入情報入力画面の表示用
  def input_view_address
    zipcode.to_s.insert(3, '-').split('-')
    "〒" + self.zipcode + "　" +self.address + "　" + self.name.to_s
  end
end
