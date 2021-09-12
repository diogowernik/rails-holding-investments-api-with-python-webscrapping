json.array! @categories do |category|
    if @portfolio_internationals.any?
        if category.id == 6
            json.set! :name, 'Internacional'
            json.data @portfolio_internationals do |portfolio_international|
                json.x portfolio_international.international.title
                json.y portfolio_international.total_today
            end
        end
    end

end