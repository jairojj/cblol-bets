class Bet < ApplicationRecord
  belongs_to :user
  belongs_to :jogo
  attr_accessor :resultado_time1
  attr_accessor :resultado_time2
  
  validates :valor, numericality: { :greater_than_or_equal_to => 200 }

end
