class RemoveFielsFromPuts < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_puts, :price, :decimal
    add_column :portfolio_puts, :total_price, :decimal
    add_column :portfolio_calls, :price, :decimal
    add_column :portfolio_calls, :total_price, :decimal
  end
end
