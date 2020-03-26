class User < ApplicationRecord
  has_many :states , dependent: :delete_all
  has_many :evennts, through: :states , dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable, :lockable

end
