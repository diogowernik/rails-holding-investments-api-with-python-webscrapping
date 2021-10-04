class AddFieldsToPortfolioFiis < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_fiis, :dividends_profit, :decimal
    add_column :portfolio_fiis, :trade_profit, :decimal
  end
end
