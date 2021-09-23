class AddNewfToPortfolioCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolio_calls, :br_stock, foreign_key: true
  end
end
