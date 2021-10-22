class RemoveFieldsFromCriptoDividends < ActiveRecord::Migration[5.2]
  def change
    remove_reference :cripto_dividends, :portfolio_fii, foreign_key: true
    remove_reference :cripto_dividends, :fii, foreign_key: true
  end
end
