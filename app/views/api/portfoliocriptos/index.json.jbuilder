
json.array! @portfoliocriptos do |portfoliocripto|
    json.id portfoliocripto.id
    json.amount portfoliocripto.amount
    json.cost portfoliocripto.cost
    json.total_today portfoliocripto.total_today
    json.total_cost portfoliocripto.total_cost
    json.category_id portfoliocripto.category.id
    json.category_title portfoliocripto.category.title
    json.portfolio_id portfoliocripto.portfolio.id
    json.portfolio_title portfoliocripto.portfolio.title
    json.cripto_id portfoliocripto.cripto.id
    json.cripto_title portfoliocripto.cripto.title
    json.cripto_ticker portfoliocripto.cripto.ticker
    json.cripto_price portfoliocripto.cripto.price
end