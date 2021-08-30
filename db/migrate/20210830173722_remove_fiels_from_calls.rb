class RemoveFielsFromCalls < ActiveRecord::Migration[5.2]
  def change
    remove_column :calls, :title, :string
    remove_column :calls, :slug, :string
    remove_column :puts, :title, :string
    remove_column :puts, :slug, :string
  end
end
