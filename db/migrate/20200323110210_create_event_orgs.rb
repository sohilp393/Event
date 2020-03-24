class CreateEventOrgs < ActiveRecord::Migration[6.0]
  def change
    create_table :event_orgs do |t|
      t.string :eventname
      t.text :description
      t.datetime :event_time
      t.time :duration

      t.timestamps
    end
  end
end
