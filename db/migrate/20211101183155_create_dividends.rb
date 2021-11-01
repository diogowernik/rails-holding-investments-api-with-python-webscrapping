class CreateDividends < ActiveRecord::Migration[5.2]
  def change
    create_table :dividends do |t|
      t.references :month, foreign_key: true
      t.references :year, foreign_key: true
      t.decimal :fiis
      t.decimal :criptos
      t.decimal :br_stocks
      t.decimal :properties
      t.decimal :equities
      t.decimal :international
      t.decimal :derivatives

      t.timestamps
    end
  end
end
