class User < ApplicationRecord
  has_many :states 
  has_many :evennts, through: :states , dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
end 
