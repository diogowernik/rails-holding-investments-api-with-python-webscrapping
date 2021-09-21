json.array! @categories do |category|
    if @portfolio_goods.any?
        if category.id == 7
            json.set! :name, 'Outros Bens'
            json.data @portfolio_goods do |portfolio_good|
                json.x portfolio_good.good.ticker
                json.y portfolio_good.total_today
            end
        end
    end
end