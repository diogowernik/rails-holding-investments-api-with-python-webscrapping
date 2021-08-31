json.extract! portfolio_holding_token, :id, :category_id, :portfolio_id, :holding_token_id, :shares_amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_holding_token_url(portfolio_holding_token, format: :json)
