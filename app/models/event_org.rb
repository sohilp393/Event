class EventOrg < ApplicationRecord
	has_many :eventstates
  	has_many :users, through: :eventstates

	validates :eventname, presence:true ,length:{mininmum:3 ,maximum:50}
	validates :description, presence:true ,length:{mininmum:10 ,maximum:500}
end
