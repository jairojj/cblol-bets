class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :jogo
  attr_accessor :resultado_time1
  attr_accessor :resultado_time2
  
  validates :valor, numericality: { :greater_than_or_equal_to => 200 }
  
  def self.verificar_vencedores
    apostas_vencedoras = Array.new
    vencedores = Array.new
    coin_total = 0
    coin_separado = 0
    
    @jogos = Jogo.where(status: true)
    
    @jogos.each do |jogo|
      
      @apostas = Bet.where(jogo_id: jogo.id)
      
      @apostas.each do |aposta|
        
        if aposta.resultado == jogo.resultado
          vencedores << aposta.user_id
          apostas_vencedoras << aposta.id
          coin_total = coin_total + aposta.valor
          puts "coin_total " + coin_total.to_s
        end
        
      end
      
    end
    
    coin_separado = coin_total / vencedores.length
    puts "vencedores " + vencedores.length.to_s
    
    vencedores.each do |vencedor|
      coin_atual = User.find(vencedor).coin
      puts "coin_atual " + coin_atual.to_s
      User.update(vencedor, :coin => coin_atual + coin_separado)
    end
    
    apostas_vencedoras.each do |aposta_vencedora|
      Bet.update(aposta_vencedora, :ganhou_qnt => coin_separado)
    end
    
  end
end
