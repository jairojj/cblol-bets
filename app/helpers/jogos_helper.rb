module JogosHelper
  def get_bets(user_id, jogo_id)
    Bet.where(user_id: user_id, jogo_id: jogo_id).take
  end
end
