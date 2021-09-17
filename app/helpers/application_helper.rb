module ApplicationHelper

  def avatar_url(user)
    gravatar_id = Digest::MD5::hexdigest(user.email).downcase
    "https://www.gravatar.com/avatar/#{gravatar_id}.jpg?d=identicon&s=150"
  end


# Resultados  
# 1 - Aberta
# 2 - Exercicio
# 3 - Pó
# 4 - Recompra
  
  # def resultado_aberta(deriva_move)
  #   if deriva_move.estado_id == 1 
  #     deriva_move.valor * deriva_move.quantidade
  #   end
  # end
  
  # def resultado_po(deriva_move)
  #   if deriva_move.estado_id == 3 
  #     deriva_move.valor * deriva_move.quantidade
  #   end
  # end
  
  # def resultado_exercicio(deriva_move) #Neste caso seria realizada uma interação com a tabela investimentos 
  #   if deriva_move.estado_id == 2
  #     if deriva_move.deriva_tipo_id == 2
  #       "Compra / #{deriva_move.quantidade}  
  #       #{deriva_move.ativo.ticker}   
  #       #{number_with_precision((
  #       (deriva_move.strike - deriva_move.valor) + 
  #       (deriva_move.corretora.corretagem_opcoes / deriva_move.quantidade) + 
  #       (deriva_move.corretora.corretagem_exerc / deriva_move.quantidade) + 
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) +
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) * deriva_move.corretora.corretagem_exerc_iss
  #       ), :precision => 2 )}" 
  #     else
  #       "Venda / #{deriva_move.quantidade}  
  #       #{deriva_move.ativo.ticker} 
  #       #{number_with_precision((
  #       (deriva_move.strike + deriva_move.valor) -
  #       (deriva_move.corretora.corretagem_opcoes / deriva_move.quantidade) - 
  #       (deriva_move.corretora.corretagem_exerc / deriva_move.quantidade) - 
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) -
  #       ((deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) * deriva_move.corretora.corretagem_exerc_iss)
  #       ), :precision => 2)}" 
  #     end
  #   end
  # end

  # def exercicio(deriva_move) 
  #   if deriva_move.estado_id == 1
  #     if deriva_move.deriva_tipo_id == 2
  #       number_with_precision((
  #       (deriva_move.strike - deriva_move.valor) + 
  #       (deriva_move.corretora.corretagem_opcoes / deriva_move.quantidade) + 
  #       (deriva_move.corretora.corretagem_exerc / deriva_move.quantidade) + 
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) +
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) * deriva_move.corretora.corretagem_exerc_iss
  #       ), :precision => 2 ) 
  #     else
  #       number_with_precision((
  #       (deriva_move.strike + deriva_move.valor) -
  #       (deriva_move.corretora.corretagem_opcoes / deriva_move.quantidade) - 
  #       (deriva_move.corretora.corretagem_exerc / deriva_move.quantidade) - 
  #       (deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) -
  #       ((deriva_move.strike * deriva_move.corretora.corretagem_exerc_porcent) * deriva_move.corretora.corretagem_exerc_iss)
  #       ), :precision => 2)
  #     end
  #   end
  # end

  # def resultado_recompra(deriva_move)
  #   if deriva_move.estado_id == 4
  #     (deriva_move.valor - deriva_move.valor_recompra) * deriva_move.quantidade
  #   end
  # end
  
  # def cor_resultado_recompra(deriva_move)
  #   if deriva_move.estado_id == 4
  #     rr = (deriva_move.valor - deriva_move.valor_recompra) * deriva_move.quantidade
  #     if rr > 0
  #       "primary"
  #     else
  #       "danger"
  #     end
  #   end
  # end
  
  # def sintetico_anual(sintetico)
  #   sintetico.jan + sintetico.fev + sintetico.mar + 
  #   sintetico.abr + sintetico.mai + sintetico.jun +
  #   sintetico.jul + sintetico.ago + sintetico.set + 
  #   sintetico.out + sintetico.nov + sintetico.dez
  # end

  
  # def cotacao_strike(deriva_move)
  #   (deriva_move.ativo.valor_atual.to_f / deriva_move.strike.to_f - 1)*100
  # end
  
  # def cotacao_exercicio(deriva_move)
  #   (deriva_move.ativo.valor_atual.to_f / exercicio(deriva_move).to_f - 1)*100
  # end
  
  # def strike_cotacao(deriva_move)
  #   (deriva_move.strike.to_f / deriva_move.ativo.valor_atual.to_f - 1)*100
  # end
  
  # def exercicio_cotacao(deriva_move)
  #   (exercicio(deriva_move).to_f / deriva_move.ativo.valor_atual.to_f - 1)*100
  # end
  
  # def yield_sintetico(deriva_move)
  #   ((deriva_move.valor) / deriva_move.strike * 100)
  # end
  
  # def cor_strike_cotacao(deriva_move)
  #   if (deriva_move.strike.to_f / deriva_move.ativo.valor_atual.to_f - 1)*100 < 0
  #     "bg-gray-lighter"
  #   end
  # end
  
  # def cor_exercicio_cotacao(deriva_move)
  #   if (exercicio(deriva_move).to_f / deriva_move.ativo.valor_atual.to_f - 1)*100 < 0
  #     "bg-gray-lighter"
  #   end
  # end
  
  # def cor_cotacao_strike(deriva_move)
  #   if (deriva_move.ativo.valor_atual.to_f / deriva_move.strike.to_f - 1)*100 < 0
  #     "bg-gray-lighter"
  #   end
  # end
  
  # def cor_cotacao_exercicio(deriva_move)
  #   if (deriva_move.ativo.valor_atual.to_f / exercicio(deriva_move).to_f - 1)*100 < 0
  #     "bg-gray-lighter"
  #   end
  # end
  
  # def texto_premio_hj(deriva_move)
  #   if deriva_move.valor_hoje != nil
  #     if deriva_move.strike * 0.01 < deriva_move.valor_hoje
  #       "Vender"
  #     end
  #   end
  # end
  
  # def texto_premio_desejado(deriva_move)
  #   if deriva_move.valor_hoje != nil
  #     if deriva_move.valor_hoje < deriva_move.valor / 2
  #       "Recomprar"
  #     end
  #   end
  # end
  
end
