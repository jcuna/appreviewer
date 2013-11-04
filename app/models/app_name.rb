class AppName < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :statuses
end
