class User < ApplicationRecord
  has_many :bets
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.name = auth.info.name
      user.password = Devise.friendly_token[0,20]
      user.picture = auth.info.image
    end
  end
  
  def link_account_from_omniauth(auth)
    self.provider = auth.provider
    self.uid = auth.uid
    self.picture = auth.info.image
    self.save
  end
  
end