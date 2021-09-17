class AddFieldToPortfolioFixedIncome < ActiveRecord::Migration[5.2]
  def change
    add_column :portfolio_fixed_incomes, :is_derivative_warranty, :boolean
  end
end
