class RankingController < ApplicationController
  def index
    @jogo = Jogo.where.not(resultado: nil).last.semana
    
    if params[:semana].nil? || params[:semana] == "all"
      @user = User.order(coin: :desc )
    else
      @user = User.all
      
      @user.each do |user|
        Bet.joins(:jogo).where("jogos.semana" => params[:semana], "bets.user_id" => user.id).sum("ganhou_qnt")
        
      end
      
    end
    
  end
end
