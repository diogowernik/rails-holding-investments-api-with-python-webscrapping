class AddFieldToPortfolioCalls < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_calls, :profit, :decimal
    add_column :portfolio_puts, :profit, :decimal
  end
end
