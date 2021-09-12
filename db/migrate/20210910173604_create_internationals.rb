class CreateInternationals < ActiveRecord::Migration[5.2]
  def change
    create_table :internationals do |t|
      t.references :international_category, foreign_key: true
      t.string :ticker
      t.string :title
      t.string :slug
      t.decimal :price

      t.timestamps
    end
  end
end
