class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :lastseenable, :omniauthable, omniauth_providers: [:facebook]

  has_and_belongs_to_many :rooms
  has_many :messages



  def is_online?
    $redis_onlines.get( self.id ) ? true : false
  end

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.password = Devise.friendly_token[0,20]
  end
end
end
