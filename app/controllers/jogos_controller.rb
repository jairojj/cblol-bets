class JogosController < ApplicationController
  def index
    @jogo = Jogo.where(status: false).first(4)
  end  
end
