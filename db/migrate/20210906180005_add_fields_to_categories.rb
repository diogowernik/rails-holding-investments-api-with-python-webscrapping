class AddFieldsToCategories < ActiveRecord::Migration[5.2]
  def change
    add_column :categories, :custom_order, :integer
  end
end
