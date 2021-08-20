class PortfolioCripto < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :cripto
end
