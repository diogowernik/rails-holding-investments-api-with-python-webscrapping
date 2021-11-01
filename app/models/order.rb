class Order < ApplicationRecord
  belongs_to :portfolio
  belongs_to :year
  belongs_to :month
end
