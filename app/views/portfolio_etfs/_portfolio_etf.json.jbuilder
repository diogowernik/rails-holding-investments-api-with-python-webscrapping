json.extract! portfolio_etf, :id, :category_id, :portfolio_id, :etf_id, :shares_amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_etf_url(portfolio_etf, format: :json)
