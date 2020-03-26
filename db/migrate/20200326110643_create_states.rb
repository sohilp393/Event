class CreateStates < ActiveRecord::Migration[6.0]
  def change
      create_table :states do |t|
      t.references :evennt, null: false, foreign_key: true
      t.references :user, null: false, foreign_key: true
      t.string :eventstate , default:"Pending"

      t.timestamps
    end
  end
end
