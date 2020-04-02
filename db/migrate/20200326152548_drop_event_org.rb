class DropEventOrg < ActiveRecord::Migration[6.0]
   def up
    drop_table :event_orgs
    drop_table :event_states
  end

  def down
    raise ActiveRecord::IrreversibleMigration
  end
end
