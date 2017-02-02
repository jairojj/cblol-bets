class RankingController < ApplicationController
  def index
    @user = User.order(:coin)
  end
end
