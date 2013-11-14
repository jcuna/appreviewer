class AppProfile < ActiveRecord::Base
  attr_accessible :name, :app_id
  has_many :statuses

 	validates :name, presence: true,
                    length: { minimum: 2 }

end
