json.array! @categories do |category|
    if @portfolio_currencies.any?
        if category.id == 1
            json.set! :name, 'Internacional'
            json.data @portfolio_currencies do |portfolio_currency|
                json.x portfolio_currency.currency.ticker
                json.y portfolio_currency.total_today
            end
        end
    end

end