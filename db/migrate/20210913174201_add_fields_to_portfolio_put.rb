class AddFieldsToPortfolioPut < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_puts, :total_strike, :decimal
  end
end
