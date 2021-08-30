class Call < ApplicationRecord
  belongs_to :br_stock
  belongs_to :expiration
end
