class User < ApplicationRecord
  has_many :states 
  has_many :evennts, through: :states , dependent: :delete_all
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
 
  scope :userdetails, ->(id){ where(id: id).first}
  scope :user_by_email, ->(email){ where(email: email)}       
end 
