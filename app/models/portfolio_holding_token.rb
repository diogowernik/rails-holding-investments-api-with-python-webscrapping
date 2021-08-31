class PortfolioHoldingToken < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :holding_token
end
