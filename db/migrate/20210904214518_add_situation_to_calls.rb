class AddSituationToCalls < ActiveRecord::Migration[5.2]
  def change
    add_reference :portfolio_calls, :situation, foreign_key: true
    add_reference :portfolio_puts, :situation, foreign_key: true
  end
end
