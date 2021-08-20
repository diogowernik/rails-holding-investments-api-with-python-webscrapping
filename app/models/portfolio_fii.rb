class PortfolioFii < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :fii
end
