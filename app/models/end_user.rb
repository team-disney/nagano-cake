class EndUser < ApplicationRecord
  # ASSOCIATIONS
  has_many :ordars
  has_many :cart_items
  has_many :addresses
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  # 論理削除 (paranoia gem) に必要な記述
  acts_as_paranoid

  # validation
  # 空白 NG
  validates :last_name, :first_name, presence: true
  # カタカナ以外 NG
  validates :last_name_kana, :first_name_kana, presence: true, format: { with: /\A[\p{katakana}\p{blank}ー－]+\z/, message: 'はカタカナで入力して下さい。'}
  # zipcode 7桁の数字以外 NG
  validates :zipcode, length: { in:7..7 }, format: { with: /\A[a-z0-9]+\z/}
  # phone_number 10-11桁の数字以外 NG
  validates :phone_number, length: { in:10..11 }, format: { with: /\A[a-z0-9]+\z/}

end