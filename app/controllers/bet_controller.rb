class BetController < ApplicationController
  def new
    @bet = Bet.new
    @jogo = Jogo.find(params[:id])
  end
  
  def create
    if params[:bet][:valor].to_i > current_user.coin.to_i || params[:bet][:valor] == ''
      erro = true
      flash[:danger] = 'Você não tem coins suficiente!'
      redirect_to "/aposta/new?id=#{params[:bet][:jogo_id]}"
    else

      case params[:bet][:resultado_time1]
        when 'vitoria'
          @jogo = Jogo.find(params[:bet][:jogo_id])
          total = @jogo.contagem_vit1 + params[:bet][:valor].to_i
          Jogo.update(params[:bet][:jogo_id], :contagem_vit1 => total)
          resultado = -1
        when 'empate'
          @jogo = Jogo.find(params[:bet][:jogo_id])
          total = @jogo.contagem_empate + params[:bet][:valor].to_i
          Jogo.update(params[:bet][:jogo_id], :contagem_empate => total)          
          resultado = 0
        when 'derrota'
          @jogo = Jogo.find(params[:bet][:jogo_id])
          total = @jogo.contagem_vit2 + params[:bet][:valor].to_i
          Jogo.update(params[:bet][:jogo_id], :contagem_vit2 => total)          
          resultado = 1
        when 'null'
          erro = true
          flash[:danger] = 'Selecione um resultado!'
          redirect_to "/aposta/new?id=#{params[:bet][:jogo_id]}"
        else
          erro = true
          flash[:danger] = 'Erro'
          redirect_to "/aposta/new?id=#{params[:bet][:jogo_id]}"
      end
    
      if !erro 
        @bet = Bet.new(params.require(:bet).permit(:user_id, :jogo_id, :valor))
        @bet.resultado = resultado
    
        if @bet.save
          @user = User.find(current_user.id)
          new_coin = @user.coin - params[:bet][:valor].to_i
          User.update(current_user.id, :coin => new_coin)

          
          flash[:success] = 'Aposta feita com sucesso'
          redirect_to '/jogos'
        end
      end
      
    end  
  end

  def index
    @bet = Bet.where(user_id: current_user.id).order(id: :desc)
  end  
end

  

