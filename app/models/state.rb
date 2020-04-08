class State < ApplicationRecord
  belongs_to :evennt
  belongs_to :user

  scope :acceptedstates, ->(user_id,eventstate){ where(user_id: user_id,eventstate: eventstate)}
  scope :pendinginvites, ->(user_id){ where(user_id: user_id)}

  scope :findstates ,->(evennt_id,user_id){ where(evennt_id:evennt_id,user_id:user_id)}
end 
