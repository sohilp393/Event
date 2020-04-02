class AddCreatedbyToEvennts < ActiveRecord::Migration[6.0]
  def change
    add_column :evennts, :createdby, :integer
  end
end
