class CreatePuts < ActiveRecord::Migration[5.2]
  def change
    create_table :puts do |t|
      t.references :br_stock, foreign_key: true
      t.references :expiration, foreign_key: true
      t.string :ticker
      t.string :title
      t.string :slug
      t.decimal :price

      t.timestamps
    end
  end
end
