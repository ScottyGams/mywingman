class User < ActiveRecord::Base
  has_many :likes
  has_many :interests, through: :likes
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :liking, ->(user) { joins(:likes).where('likes.interest_id in (?)', user.interest_ids).where("likes.user_id != ?", user.id) }

  scope :matches, ->(user) { User.liking(user).select("users.*, count(likes.user_id) AS likes_count").group("users.id").order("likes_count DESC") }


  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :blurb, :image, :likes, :location, :name, :phone, :email, :password, :password_confirmation, :remember_me, :uid, :provider, :token

  mount_uploader :image, UserImageUploader

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

  def matched_users
    User.matches(self).includes(:interests)
  end

  def common_interests(user)
    (self.interests & user.interests).map(&:name).to_sentence
  end





end