class CreateEvennts < ActiveRecord::Migration[6.0]
  def change
      create_table :evennts do |t|
      t.string :eventname
      t.text :description
      t.date :eventtime
      t.time :duration

      t.timestamps
    end
  end
end
