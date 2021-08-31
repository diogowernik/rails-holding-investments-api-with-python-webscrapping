class PortfolioEtf < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :etf
end
