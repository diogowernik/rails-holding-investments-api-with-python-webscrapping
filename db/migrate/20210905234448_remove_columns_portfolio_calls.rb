class RemoveColumnsPortfolioCalls < ActiveRecord::Migration[5.2]
  def change
    remove_column :portfolio_calls, :total_cost
    remove_column :portfolio_calls, :share_cost
    remove_column :portfolio_puts, :total_cost
    remove_column :portfolio_calls, :share_cost
  end
end
