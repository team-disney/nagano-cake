class Address < ApplicationRecord
  # ASSOCIATIONS
  belongs_to :end_user

  # 購入情報入力画面の表示用
  def input_view_address
    zipcode.to_s.insert(3, '-').split('-')
    "〒" + self.zipcode + "　" +self.address + "　" + self.name.to_s
  end

  # 論理削除 (paranoia gem) に必要な記述
  acts_as_paranoid

  # validation
  # zipcode 7桁の数字以外 NG
  validates :zipcode, length: { in:7..7 }, format: { with: /\A[a-z0-9]+\z/}
    # name, address　空白 NG
  validates :name, :address, presence: true

end
