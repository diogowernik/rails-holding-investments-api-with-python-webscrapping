json.extract! portfolio_currency, :id, :category_id, :portfolio_id, :currency_id, :shares_amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_currency_url(portfolio_currency, format: :json)
