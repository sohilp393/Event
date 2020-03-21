class AddUserIdToEventOrgs < ActiveRecord::Migration[6.0]
  def change
	add_column :event_orgs, :user_id, :integer
  end
end
