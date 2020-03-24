class EventState < ApplicationRecord
	belongs_to :event_org
  	belongs_to :user
end
