json.array! @categories do |category|
    if @portfolio_properties.any?
        if category.id == 5
            json.set! :name, 'Criptomoedas'
            json.data @portfolio_properties do |portfolio_property|
                json.x portfolio_property.property.ticker
                json.y portfolio_property.total_today
            end
        end
    end

end