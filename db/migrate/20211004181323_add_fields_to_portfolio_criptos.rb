class AddFieldsToPortfolioCriptos < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_criptos, :dividends_profit, :decimal
    add_column :portfolio_criptos, :trade_profit, :decimal
  end
end
