class PortfolioFixedIncome < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :fixed_income
end
