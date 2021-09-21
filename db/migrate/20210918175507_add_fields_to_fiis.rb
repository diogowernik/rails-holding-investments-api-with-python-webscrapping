class AddFieldsToFiis < ActiveRecord::Migration[5.2]
  def change
    add_column :fiis, :one_year_price, :decimal
    add_column :fiis, :thirty_days_price, :decimal
    add_column :fiis, :from_the_top, :decimal
    add_column :fiis, :from_the_bottom, :decimal
    add_column :fiis, :last_dividend, :decimal
    add_column :fiis, :last_yield, :decimal
    add_column :fiis, :six_m_yield, :decimal
    add_column :fiis, :twelve_m_yield, :decimal
    add_column :fiis, :p_vpa, :decimal
    add_column :fiis, :setor, :string
    add_column :fiis, :assets, :decimal
  end
end
