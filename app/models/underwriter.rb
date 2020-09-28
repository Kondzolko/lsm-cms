class Underwriter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, # :recoverable, # :registerable,
         :rememberable, :validatable, :trackable

  has_many :deals
end
