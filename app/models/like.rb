class Like < ActiveRecord::Base
  belongs_to :user
  attr_accessible :interest_id, :user_id
end
