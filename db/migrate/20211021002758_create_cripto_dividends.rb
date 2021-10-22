class CreateCriptoDividends < ActiveRecord::Migration[5.2]
  def change
    create_table :cripto_dividends do |t|
      t.references :category, foreign_key: true
      t.references :portfolio_fii, foreign_key: true
      t.references :fii, foreign_key: true
      t.references :month, foreign_key: true
      t.references :year, foreign_key: true
      t.date :record_date
      t.date :pay_date
      t.decimal :value_per_share
      t.decimal :total
      t.decimal :yield_on_cost

      t.timestamps
    end
  end
end
