class AddExToPortfolioCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolio_calls, :expiration, foreign_key: true
  end
end
