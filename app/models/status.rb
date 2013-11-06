class Status < ActiveRecord::Base
  attr_accessible :content, :user_id, :application
  	
  	belongs_to :user
  	belongs_to :app_profile


	validates :content, presence: true,
                    length: { minimum: 2 }

    validates :application, presence: true,
                    length: { minimum: 2 }


end