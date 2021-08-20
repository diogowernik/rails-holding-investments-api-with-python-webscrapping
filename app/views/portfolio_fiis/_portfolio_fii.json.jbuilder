json.extract! portfolio_fii, :id, :category_id, :portfolio_id, :cripto_id, :amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_fii_url(portfolio_fii, format: :json)
