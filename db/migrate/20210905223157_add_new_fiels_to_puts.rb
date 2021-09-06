class AddNewFielsToPuts < ActiveRecord::Migration[5.2]
  def change
    add_column :puts, :is_disable, :boolean
    add_column :puts, :prize, :decimal
    add_column :puts, :total_prize, :decimal
    add_column :calls, :is_disable, :boolean
    add_column :calls, :prize, :decimal
    add_column :calls, :total_prize, :decimal
  end
end
