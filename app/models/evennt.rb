class Evennt < ApplicationRecord
	has_many :states
  has_many :users, through: :states , dependent: :delete_all

	validates :eventname, presence:true ,length:{mininmum:3 ,maximum:50}
	validates :description, presence:true ,length:{mininmum:10 ,maximum:500}

  attr_accessor :email

end
