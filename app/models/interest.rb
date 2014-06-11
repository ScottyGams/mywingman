class Interest < ActiveRecord::Base
  has_many :likes
  has_many :users, through: :likes
  attr_accessible :name
end
