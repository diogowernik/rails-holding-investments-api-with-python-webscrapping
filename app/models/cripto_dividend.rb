class CriptoDividend < ApplicationRecord
  belongs_to :category
  belongs_to :portfolio_cripto
  belongs_to :cripto
  belongs_to :month
  belongs_to :year
  belongs_to :portfolio
end
