class CreateBrStocks < ActiveRecord::Migration[5.2]
  def change
    create_table :br_stocks do |t|
      t.string :ticker
      t.string :title
      t.string :slug
      t.decimal :price

      t.timestamps
    end
  end
end
