class AddFieldToCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :calls, :strike, :decimal
    add_column :puts, :strike, :decimal
  end
end
