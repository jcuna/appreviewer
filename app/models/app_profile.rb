class AppProfile < ActiveRecord::Base
  attr_accessible :name
  has_many :statuses
end
