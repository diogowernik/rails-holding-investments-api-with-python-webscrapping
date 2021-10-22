class AddFieldToCriptoDividends < ActiveRecord::Migration[5.2]
  def change
    add_reference :cripto_dividends, :portfolio, foreign_key: true
  end
end
