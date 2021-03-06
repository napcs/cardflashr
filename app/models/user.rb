class User < ActiveRecord::Base
  has_many :decks

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :omniauthable, :omniauth_providers => [:facebook, :twitter]

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|

      if auth.provider == "facebook"
        user.email = auth.info.email
      elsif auth.provider == "twitter"
         user.email = auth.info.nickname << "@twitter.com"
      end
      user.password = Devise.friendly_token[0,20]
    end
  end
end
