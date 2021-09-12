class PortfolioInternational < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :international
end
