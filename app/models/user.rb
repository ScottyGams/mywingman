class User < ActiveRecord::Base
  attr_accessible :blurb, :image, :likes, :location, :name, :phone
end
