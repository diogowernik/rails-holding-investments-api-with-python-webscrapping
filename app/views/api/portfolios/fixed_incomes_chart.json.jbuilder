json.array! @categories do |category|
    if @portfolio_fixed_incomes.any?
        if category.id == 5
            json.set! :name, 'Criptomoedas'
            json.data @portfolio_fixed_incomes do |portfolio_fixed_income|
                json.x portfolio_fixed_income.fixed_income.ticker
                json.y portfolio_fixed_income.total_today
            end
        end
    end

end