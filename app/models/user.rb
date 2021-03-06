class User < ActiveRecord::Base
  has_many :likes
  has_many :interests, through: :likes
  has_many :friendships
  has_many :friends, :through => :friendships
  has_many :inverse_friendships, :class_name => "Friendship", :foreign_key => "friend_id"
  has_many :inverse_friends, :through => :inverse_friendships, :source => :user

  scope :liking, ->(user) { joins(:likes).where('likes.interest_id in (?)', user.interest_ids).where("likes.user_id != ?", user.id) }

  scope :matches, ->(user) { User.liking(user).select("users.*, count(likes.user_id) AS likes_count").group("users.id").order("likes_count DESC").near([user.lat,user.lng],200) }

  geocoded_by :location, latitude: :lat, longitude: :lng
  after_validation :geocode

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :omniauthable, omniauth_providers: [:facebook]

  # Setup accessible (or protected) attributes for your model
  attr_accessible :blurb, :image, :likes, :location, :name, :phone, :email, :lat, :lng, :password, :password_confirmation, :remember_me, :uid, :provider, :token, :current_password

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
        user.name = auth.extra.raw_info.name
        user.token = auth.credentials.token
        user.email = auth.info.email
        user.image = auth.info.image
        user.blurb = auth.extra.raw_info.bio
        user.location = (auth.extra.raw_info.location.name rescue nil)
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
    (self.interests & user.interests).map(&:name)
  end

  def find_midpoint(user)
    if self.location
      my_location=Geokit::Geocoders::GoogleGeocoder.geocode self.location
      their_location=Geokit::Geocoders::GoogleGeocoder.geocode user.location
      midpoint=my_location.midpoint_to(their_location)
    end
  end

end
