
# json.fiis number_with_precision(@fiis_total/@total * 100, precision: 2, separator: ",")
# json.criptos number_with_precision(@portfolio_criptos.sum(:total_today)/@total * 100, precision: 2, separator: ",")
# json.ações number_with_precision(@portfolio_br_stocks.sum(:total_today)/@total * 100, precision: 2, separator: ",")
# json.imoveis number_with_precision(@portfolio_properties.sum(:total_today)/@total * 100, precision: 2, separator: ",")
# json.rendafixa number_with_precision(@portfolio_fixed_incomes.sum(:total_today)/@total * 100, precision: 2, separator: ",")
# json.internacional number_with_precision(@portfolio_internationals.sum(:total_today)/@total * 100, precision: 2, separator: ",")
# json.outrosbens number_with_precision(@portfolio_goods.sum(:total_today)/@total * 100, precision: 2, separator: ",")

json.array! [
    number_with_precision(@portfolio_br_stocks.sum(:total_today)/@total * 100, precision: 2, separator: ","),
    number_with_precision(@fiis_total/@total * 100, precision: 2, separator: ","),
    number_with_precision(@portfolio_internationals.sum(:total_today)/@total * 100, precision: 2, separator: ","),
    number_with_precision(@portfolio_fixed_incomes.sum(:total_today)/@total * 100, precision: 2, separator: ","),
    number_with_precision(@portfolio_properties.sum(:total_today)/@total * 100, precision: 2, separator: ","),
    number_with_precision(@portfolio_criptos.sum(:total_today)/@total * 100, precision: 2, separator: ","),
    number_with_precision(@portfolio_goods.sum(:total_today)/@total * 100, precision: 2, separator: ",")
]