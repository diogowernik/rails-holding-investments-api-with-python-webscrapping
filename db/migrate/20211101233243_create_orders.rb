class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :portfolio, foreign_key: true
      t.references :year, foreign_key: true
      t.references :month, foreign_key: true
      t.decimal :total_today
      t.decimal :order_value
      t.string :order_type
      t.decimal :tokens_amount
      t.decimal :token_price
      t.decimal :month_profit

      t.timestamps
    end
  end
end
