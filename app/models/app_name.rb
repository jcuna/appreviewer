class AppName < ActiveRecord::Base
  attr_accessible :appName
  has_many :statuses


  def appURL
    	stripped_appURL = appName.strip
      downcased_appURL = stripped_appURL.downcase
   end

end
