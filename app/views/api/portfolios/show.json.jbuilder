# json.extract! @portfolio, :id, :title, :slug

# json.treechart 
json.array! @categories do |category|
    if @portfolio_criptos.any?
        if category.id == 1
            json.set! :name, 'Criptomoedas'
            json.data @portfolio_criptos do |portfolio_cripto|
                json.x portfolio_cripto.cripto.ticker
                json.y portfolio_cripto.total_today
            end
        end
    end
    if @portfolio_fiis.any?
        if category.id == 2
            json.set! :name, 'Fundos Imobiliários'
            json.data @portfolio_fiis do |portfolio_fii|
                json.x portfolio_fii.fii.ticker
                json.y portfolio_fii.total_today
            end
        end
    end
    if @portfolio_subscriptions.any?
        if category.id == 10
            json.set! :name, 'Subscrições'
            json.data @portfolio_subscriptions do |portfolio_subscription|
                json.x portfolio_subscription.subscription.ticker
                json.y portfolio_subscription.total_today
            end
        end
    end
    if @portfolio_br_stocks.any?
        if category.id == 3
            json.set! :name, 'Ações Brasileiras'
            json.data @portfolio_br_stocks do |portfolio_br_stock|
                json.x portfolio_br_stock.br_stock.ticker
                json.y portfolio_br_stock.total_today
            end
        end
    end
    if @portfolio_properties.any?
        if category.id == 4
            json.set! :name, 'Imóveis'
            json.data @portfolio_properties do |portfolio_property|
                json.x portfolio_property.property.ticker
                json.y portfolio_property.total_today
            end
        end
    end
end