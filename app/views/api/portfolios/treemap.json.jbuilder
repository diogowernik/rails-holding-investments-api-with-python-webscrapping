json.array! @categories do |category|
    if @portfolio_fiis.any?
        if category.id == 2
            json.set! :name, category.title
            json.data @portfolio_fiis do |portfolio_fii|
                json.x portfolio_fii.fii.ticker
                json.y portfolio_fii.total_today
            end
        end
    end
    if @portfolio_criptos.any?
        if category.id == 1
            json.set! :name, 'Criptomoedas'
            json.data @portfolio_criptos do |portfolio_cripto|
                json.x portfolio_cripto.cripto.ticker
                json.y portfolio_cripto.total_today
            end
        end
    end
end