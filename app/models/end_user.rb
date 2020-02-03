class EndUser < ApplicationRecord
  # ASSOCIATIONS
  has_many :ordars
  has_many :cart_items
  has_many :addresses
  
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  acts_as_paranoid
end