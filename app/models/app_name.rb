class AppName < ActiveRecord::Base
  attr_accessible :appName, :content, :status

  has_many :statuses

end
  