class AddToPortfolioPuts < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolio_puts, :br_stock, foreign_key: true
    add_reference :portfolio_puts, :expiration, foreign_key: true
  end
end
