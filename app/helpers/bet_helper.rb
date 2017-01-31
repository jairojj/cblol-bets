module BetHelper
  def get_jogo(id)
    Jogo.find(id)
  end
end
