class AppName < ActiveRecord::Base
  attr_accessible :appName, :statuses

  has_many :statuses

end
  