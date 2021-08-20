class CreatePortfolioFiis < ActiveRecord::Migration[5.2]
  def change
    create_table :portfolio_fiis do |t|
      t.references :category, foreign_key: true
      t.references :portfolio, foreign_key: true
      t.references :fii, foreign_key: true
      t.decimal :shares_amount
      t.decimal :share_cost
      t.decimal :total_cost
      t.decimal :total_today

      t.timestamps
    end
  end
end
