class Status < ActiveRecord::Base
  attr_accessible :content, :user_id, :application, :app_id
  	
  	belongs_to :user
  	belongs_to :name


	validates :content, presence: true,
                    length: { minimum: 2 }

	validates :application, presence: true,
                    length: { minimum: 2 }
   

end