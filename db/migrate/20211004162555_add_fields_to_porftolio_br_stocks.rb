class AddFieldsToPorftolioBrStocks < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_br_stocks, :dividend_profit, :decimal
    add_column :portfolio_br_stocks, :trade_profit, :decimal
    add_column :portfolio_br_stocks, :derivatives_profit, :decimal
  end
end
