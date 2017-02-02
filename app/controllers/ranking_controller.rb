class RankingController < ApplicationController
  def index
    @user = User.order(coin: :desc )
  end
end
