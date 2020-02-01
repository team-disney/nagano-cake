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
end