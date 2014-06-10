class User < ActiveRecord::Base
  has_many :likes
  has_many :interests, through: :likes

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :blurb, :image, :likes, :location, :name, :phone, :email, :password, :password_confirmation, :remember_me, :uid, :provider, :token

  def self.from_omniauth(auth)
      if user = User.find_by_email(auth.info.email)
        user.provider = auth.provider
        user.uid = auth.uid
        user.token = auth.credentials.token
        user
      else
        where(auth.slice(:provider, :uid)).first_or_create do |user|
          user.provider = auth.provider
          user.uid = auth.uid
          user.token = auth.credentials.token
          user.email = auth.info.email
          user.image = auth.info.image
          user.password = Devise.friendly_token[0,20]
      end
    end
  end

  def graph
    @graph ||= Koala::Facebook::API.new(self.token)
  end

  def fb_likes
    @fb_likes ||= graph.get_connections 'me', 'likes'
  end

end