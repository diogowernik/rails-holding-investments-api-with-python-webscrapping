class AddFieldsToCriptoDividends < ActiveRecord::Migration[5.2]
  def change
    add_column :cripto_dividends, :brl_total, :decimal
    add_column :cripto_dividends, :usd_total, :decimal
  end
end
