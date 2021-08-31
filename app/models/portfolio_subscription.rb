class PortfolioSubscription < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :subscription
end
