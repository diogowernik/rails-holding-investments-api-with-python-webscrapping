# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


user = User.new
user.email = 'admin@portaisdobem.org'
user.password = '123456'
user.password_confirmation = '123456'
user.save!

Tipo.create( nome: 'Caixas' )
Tipo.create( nome: 'Garantias' )
Tipo.create( nome: 'Ações' )
Tipo.create( nome: 'Fiis' )
Tipo.create( nome: 'Opções' )

Carteira.create( nome: 'Warren Buffet', user_id: 1 )
Carteira.create( nome: 'Ray Dalio', user_id: 1 )

Ativo.create( tipo_id: 1, ticker: 'Caixa' )
Ativo.create( tipo_id: 2, ticker: 'Garantia' )
Ativo.create( tipo_id: 3, ticker: 'EGIE3' )
Ativo.create( tipo_id: 3, ticker: 'TAEE11' )
Ativo.create( tipo_id: 3, ticker: 'ITSA4' )
Ativo.create( tipo_id: 3, ticker: 'ITUB4' )
Ativo.create( tipo_id: 3, ticker: 'BBDC4' )
Ativo.create( tipo_id: 3, ticker: 'CMIG4' )
Ativo.create( tipo_id: 3, ticker: 'SANB11' )
Ativo.create( tipo_id: 3, ticker: 'VIVT4' )
Ativo.create( tipo_id: 3, ticker: 'EQTL3' )
Ativo.create( tipo_id: 3, ticker: 'SBSP3' )
Ativo.create( tipo_id: 3, ticker: 'TRPL4' )
Ativo.create( tipo_id: 3, ticker: 'BBAS3' )
Ativo.create( tipo_id: 3, ticker: 'BBSE3' )
Ativo.create( tipo_id: 4, ticker: 'VVPR11' )
Ativo.create( tipo_id: 4, ticker: 'KNRI11' )
Ativo.create( tipo_id: 4, ticker: 'HCRI11' )
Ativo.create( tipo_id: 4, ticker: 'GGRC11' )
Ativo.create( tipo_id: 4, ticker: 'HGLG11' )
Ativo.create( tipo_id: 4, ticker: 'ALZR11' )
Ativo.create( tipo_id: 4, ticker: 'BTLG11' )
Ativo.create( tipo_id: 4, ticker: 'FIIB11' )
Ativo.create( tipo_id: 4, ticker: 'HLOG11' )
Ativo.create( tipo_id: 4, ticker: 'XPIN11' )
Ativo.create( tipo_id: 4, ticker: 'XPLG11' )
Ativo.create( tipo_id: 4, ticker: 'VILG11' )
Ativo.create( tipo_id: 4, ticker: 'IRDM11' )
Ativo.create( tipo_id: 4, ticker: 'KNIP11' )
Ativo.create( tipo_id: 4, ticker: 'MXRF11' )
Ativo.create( tipo_id: 4, ticker: 'OUCY11' )
Ativo.create( tipo_id: 4, ticker: 'RECR11' )
Ativo.create( tipo_id: 4, ticker: 'TGAR11' )
Ativo.create( tipo_id: 4, ticker: 'TORD11' )
Ativo.create( tipo_id: 4, ticker: 'VRTA11' )
Ativo.create( tipo_id: 4, ticker: 'HFOF11' )
Ativo.create( tipo_id: 4, ticker: 'HGFF11' )
Ativo.create( tipo_id: 4, ticker: 'MGFF11' )
Ativo.create( tipo_id: 4, ticker: 'BCFF11' )
Ativo.create( tipo_id: 4, ticker: 'HGRU11' )

Estado.create( status: 'Aberta' )
Estado.create( status: 'Exercicio' )
Estado.create( status: 'Po' )
Estado.create( status: 'Recompra' )

Vencimento.create( data: DateTime.strptime('21/09/2020', '%d/%m/%Y') )
Vencimento.create( data: DateTime.strptime('19/10/2020', '%d/%m/%Y') )

Derivativo.create( ativo_id: 1, vencimento_id: 1, codigo: 'BBASI355', tipo: 'Call', strike: '35.16' )
Derivativo.create( ativo_id: 1, vencimento_id: 1, codigo: 'BBASI455', tipo: 'Call', strike: '34.16' )
Derivativo.create( ativo_id: 1, vencimento_id: 1, codigo: 'BBASU322', tipo: 'Put', strike: '31.91' )
Derivativo.create( ativo_id: 10, vencimento_id: 1, codigo: 'VIVTU480', tipo: 'Put', strike: '47.53' )
Derivativo.create( ativo_id: 8, vencimento_id: 2, codigo: 'BBDCJ210', tipo: 'Call', strike: '21.65' )
Derivativo.create( ativo_id: 6, vencimento_id: 2, codigo: 'ITUBJ249', tipo: 'Call', strike: '24.86' )

Corretora.create( nome: 'Clear', moeda: '', corretagem_fiis: 0.0 , corretagem_acoes: 0.0 , corretagem_opcoes: 0.0 , corretagem_exerc: 0.0 , corretagem_exerc_porcent: 0.005, corretagem_exerc_iss: 0.1 )
Corretora.create( nome: 'Modal', moeda: '', corretagem_fiis: 1.49 , corretagem_acoes: 1.49 , corretagem_opcoes: 1.49 , corretagem_exerc: 1.49 , corretagem_exerc_porcent: 0.0, corretagem_exerc_iss: 0.0 )
Corretora.create( nome: 'Capital', moeda: '', corretagem_fiis: 1.99 , corretagem_acoes: 1.99 , corretagem_opcoes: 1.99 , corretagem_exerc: 1.99 , corretagem_exerc_porcent: 0.0, corretagem_exerc_iss: 0.0 )
Corretora.create( nome: 'XP', moeda: '', corretagem_fiis: 0.0 , corretagem_acoes: 0.0 , corretagem_opcoes: 0.0 , corretagem_exerc: 0.0 , corretagem_exerc_porcent: 0.005, corretagem_exerc_iss: 0.1 )

AtivoMove.create( carteira_id: 1, tipo_id: 3, ativo_id: 10, corretora_id: 1, investimento_id: 2, valor: 30.0, data: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Compra', )
AtivoMove.create( carteira_id: 1, tipo_id: 3, ativo_id: 14, corretora_id: 1, investimento_id: 6, valor: 30.0, data: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Compra', )
AtivoMove.create( carteira_id: 2, tipo_id: 3, ativo_id: 6, corretora_id: 3, investimento_id: 8, valor: 30.0, data: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Compra', )
AtivoMove.create( carteira_id: 1, tipo_id: 4, ativo_id: 25, corretora_id: 4, investimento_id: 4, valor: 100.0, data: DateTime.strptime('05/10/2020', '%d/%m/%Y'), quantidade: 50, movimento: 'Compra', )
AtivoMove.create( carteira_id: 2, tipo_id: 4, ativo_id: 34, corretora_id: 4, investimento_id: 10, valor: 10.0, data: DateTime.strptime('04/08/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Compra', )
AtivoMove.create( carteira_id: 2, tipo_id: 4, ativo_id: 32, corretora_id: 2, investimento_id: 9, valor: 90.0, data: DateTime.strptime('12/10/2020', '%d/%m/%Y'), quantidade: 100, movimento: 'Compra', )

DerivaMove.create( carteira_id: 1, derivativo_id: 1, estado_id: 3, corretora_id: 1, investimento_id: 1, valor: 0.23, valor_recompra: '', resultado: '', data: DateTime.strptime('02/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Venda' )
DerivaMove.create( carteira_id: 1, derivativo_id: 2, estado_id: 3, corretora_id: 1, investimento_id: 1, valor: 0.6, valor_recompra: '', resultado: '', data: DateTime.strptime('02/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 200, movimento: 'Venda' )
DerivaMove.create( carteira_id: 1, derivativo_id: 3, estado_id: 2, corretora_id: 1, investimento_id: 6, valor: 0.38, valor_recompra: '', resultado:'' , data: DateTime.strptime('09/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 100, movimento: 'Venda' )
DerivaMove.create( carteira_id: 1, derivativo_id: 4, estado_id: 2, corretora_id: 1, investimento_id: 2, valor: 0.4, valor_recompra: '', resultado: '', data: DateTime.strptime('09/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('19/10/2020', '%d/%m/%Y'), quantidade: 100, movimento: 'Venda' )
DerivaMove.create( carteira_id: 1, derivativo_id: 5, estado_id: 4, corretora_id: 1, investimento_id: 1, valor: 0.4, valor_recompra: '0.04', resultado: '', data: DateTime.strptime('22/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('10/10/2020', '%d/%m/%Y'), quantidade: 100, movimento: 'Venda' )
DerivaMove.create( carteira_id: 1, derivativo_id: 5, estado_id: 1, corretora_id: 1, investimento_id: 2, valor: 0.28, valor_recompra: '', resultado: '', data: DateTime.strptime('22/09/2020', '%d/%m/%Y'), data_recompra: DateTime.strptime('18/10/2020', '%d/%m/%Y'), quantidade: 300, movimento: 'Venda' )

Investimento.create( carteira_id: 1, tipo_id: 1, ativo_id: 1, corretora_id: 1, valor_medio: 500.0, quantidade: 1, )
Investimento.create( carteira_id: 1, tipo_id: 3, ativo_id: 10, corretora_id: 1, valor_medio: 45.34, quantidade: 200, )
Investimento.create( carteira_id: 1, tipo_id: 3, ativo_id: 5, corretora_id: 1, valor_medio: 8.8, quantidade: 400, )
Investimento.create( carteira_id: 1, tipo_id: 4, ativo_id: 25, corretora_id: 4, valor_medio: 112.45, quantidade: 50, )
Investimento.create( carteira_id: 1, tipo_id: 1, ativo_id: 28, corretora_id: 1, valor_medio: 101.0, quantidade: 50, )
Investimento.create( carteira_id: 1, tipo_id: 3, ativo_id: 14, corretora_id: 1, valor_medio: 29.0, quantidade: 300, )
Investimento.create( carteira_id: 2, tipo_id: 1, ativo_id: 4, corretora_id: 1, valor_medio: 27.0, quantidade: 100, )
Investimento.create( carteira_id: 2, tipo_id: 3, ativo_id: 6, corretora_id: 3, valor_medio: 15.0, quantidade: 400, )
Investimento.create( carteira_id: 2, tipo_id: 4, ativo_id: 32, corretora_id: 2, valor_medio: 90.0, quantidade: 50, )
Investimento.create( carteira_id: 2, tipo_id: 4, ativo_id: 34, corretora_id: 4, valor_medio: 10.0, quantidade: 200, )
Investimento.create( carteira_id: 2, tipo_id: 1, ativo_id: 1, corretora_id: 1, valor_medio: 500.0, quantidade: 1, )

