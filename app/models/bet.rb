class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :jogo
  attr_accessor :resultado_time1
  attr_accessor :resultado_time2
  
  validates :valor, numericality: { :greater_than_or_equal_to => 200 }
  
  def self.verificar_vencedores
    
    @jogos = Jogo.where(status: true).last(4)
    
    @jogos.each do |jogo|
      
      apostas_vencedoras = 0
      vencedores = Array.new
      perdedores = 0
      coin_apostado = 0
      coin_final = 0

      @apostas = Bet.where(jogo_id: jogo.id)
      
      @apostas.each do |aposta|
        
        if aposta.resultado == jogo.resultado
          vencedores << aposta.user_id
          apostas_vencedoras << aposta.id
        else
          perdedores = perdedores + aposta.valor
        end
        
      end
      
        puts "vencedores " + vencedores.length.to_s
        
        vencedores.each do |vencedor|
          coin_atual = User.find(vencedor).coin
          coin_apostado = Bet.where(user_id: vencedor, jogo_id: jogo.id).take
          puts "coin_atual " + coin_atual.to_s
          coin_final = coin_atual + coin_apostado.valor + ( perdedores / vencedores.length )
          puts "coin final: " + coin_final.to_s
          User.update(vencedor, :coin => coin_final)
          aposta_vencedora = Bet.where(jogo_id: jogo.id, user_id: vencedor).take
          Bet.update(aposta_vencedora.id, :ganhou_qnt =>  coin_apostado.valor + ( perdedores / vencedores.length ) )
        end
    
    end
  
  end
end
