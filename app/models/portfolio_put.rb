class PortfolioPut < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio
  belongs_to :put
  belongs_to :situation
end
