json.array! @portfolios do |portfolio|
    json.value portfolio.id
    json.label portfolio.title
end