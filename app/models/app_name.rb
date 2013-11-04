class AppName < ActiveRecord::Base
  attr_accessible :content, :user_id
  has_many :statuses


  def appURL
    	stripped_appURL = appName.strip
      downcased_appURL = stripped_appURL.downcase
   end

end
