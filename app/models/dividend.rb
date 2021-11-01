class Dividend < ApplicationRecord
  belongs_to :month
  belongs_to :year
  belongs_to :portfolio
end
