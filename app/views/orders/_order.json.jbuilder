json.extract! order, :id, :portfolio_id, :year_id, :month_id, :total_today, :order_value, :order_type, :tokens_amount, :token_price, :month_profit, :created_at, :updated_at
json.url order_url(order, format: :json)
