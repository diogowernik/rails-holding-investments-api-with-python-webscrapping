json.extract! portfolio_stock, :id, :category_id, :portfolio_id, :stock_id, :shares_amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_stock_url(portfolio_stock, format: :json)
