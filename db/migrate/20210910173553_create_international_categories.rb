class CreateInternationalCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :international_categories do |t|
      t.string :title
      t.string :slug

      t.timestamps
    end
  end
end
