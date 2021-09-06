json.array! @categories do |category|
    if @portfolio_fiis.any?
        if category.id == 2
            json.set! :name, 'Fundos Imobiliários'
            json.data @portfolio_fiis do |portfolio_fii|
                json.x portfolio_fii.fii.ticker
                json.y portfolio_fii.total_today
            end
        end
    end
end