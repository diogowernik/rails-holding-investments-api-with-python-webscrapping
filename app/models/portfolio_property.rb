class PortfolioProperty < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :property
end
