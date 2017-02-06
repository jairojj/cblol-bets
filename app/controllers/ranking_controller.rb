class RankingController < ApplicationController
  def index
    @jogo = Jogo.where.not(resultado: nil).last.semana
    
    if params[:semana].nil? || params[:semana] == "all"
      @user = User.order(coin: :desc )
    else
      @user = User.order(coin: :desc )
      @coin_semana = Hash.new

      @user.each do |user|
        @total_coin = Bet.joins(:jogo).where("jogos.semana" => params[:semana], "bets.user_id" => user.id).sum("ganhou_qnt")
        @coin_semana[user.id] = @total_coin
      end
      
    end
    
  end
end
