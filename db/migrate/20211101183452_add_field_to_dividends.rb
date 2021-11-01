class AddFieldToDividends < ActiveRecord::Migration[5.2]
  def change
    add_reference :dividends, :portfolio, foreign_key: true
  end
end
