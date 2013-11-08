class AppProfile < ActiveRecord::Base
  attr_accessible :name
  has_many :statuses

 	validates :name, presence: true,
                    length: { minimum: 2 }

end
