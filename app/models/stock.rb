class Stock < ApplicationRecord
    has_many :calls
    has_many :puts
    has_many :portfolio_calls
    has_many :portfolio_puts
end
