json.array! @categories do |category|
    if @portfolio_br_stocks.any?
        if category.id == 3
            json.set! :name, 'Ações Brasileiras'
            json.data @portfolio_br_stocks do |portfolio_br_stock|
                json.x portfolio_br_stock.br_stock.ticker
                json.y portfolio_br_stock.total_today
            end
        end
    end
end