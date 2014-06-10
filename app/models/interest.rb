class Interest < ActiveRecord::Base
  belongs_to :user, through: :likes
  attr_accessible :name
end
