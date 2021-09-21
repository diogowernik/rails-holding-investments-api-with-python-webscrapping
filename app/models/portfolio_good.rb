class PortfolioGood < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :good
end
