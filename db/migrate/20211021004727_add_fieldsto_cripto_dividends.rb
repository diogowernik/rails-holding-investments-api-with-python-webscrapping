class AddFieldstoCriptoDividends < ActiveRecord::Migration[5.2]
  def change
    add_reference :cripto_dividends, :portfolio_cripto, foreign_key: true
    add_reference :cripto_dividends, :cripto, foreign_key: true
  end
end
