class PortfolioCurrency < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :currency
end
