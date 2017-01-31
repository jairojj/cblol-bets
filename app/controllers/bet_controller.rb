class BetController < ApplicationController
  def new
    @bet = Bet.new
    @jogo = Jogo.find(params[:id])
  end
  
  def create
    if params[:bet][:valor].to_i > current_user.coin.to_i
      flash[:danger] = 'Você não tem coins suficiente!'
      redirect_to '/aposta/new?id=#{params[:bet][:jogo_id]}'
    else
      if params[:bet][:resultado_time1] == 'vitoria'
        resultado = -1
      elsif params[:bet][:resultado_time1] == 'empate'
        resultado = 0
      elsif params[:bet][:resultado_time1] == 'derrota'
        resultado = 1
      else
        flash[:danger] = 'Erro!'
        redirect_to '/aposta/new?id=#{params[:bet][:jogo_id]}'
      end
    
      @bet = Bet.new(params.require(:bet).permit(:user_id, :jogo_id, :valor))
      @bet.resultado = resultado
  
      if @bet.save
        @user = User.find(current_user.id)
        @user.coin = @user.coin - params[:bet][:valor].to_i
        
        flash[:success] = 'Aposta feita com sucesso'
        redirect_to '/jogos'
      end
      
    end  
  end  
end

  

