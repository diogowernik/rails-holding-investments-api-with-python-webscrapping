class PortfolioBrStock < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :br_stock
end
