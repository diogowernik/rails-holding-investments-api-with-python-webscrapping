json.extract! portfolio_subscription, :id, :category_id, :portfolio_id, :subscription_id, :shares_amount, :share_cost, :total_cost, :total_today, :created_at, :updated_at
json.url portfolio_subscription_url(portfolio_subscription, format: :json)
