class Status < ActiveRecord::Base
  attr_accessible :content, :user_id, :application
  	
  	belongs_to :user
  	# belongs_to :name class_name: 'AppProfile', foreign_key: 'app_id'


	validates :content, presence: true,
                    length: { minimum: 2 }

    validates :application, presence: true,
                    length: { minimum: 2 }

end