class Status < ActiveRecord::Base
  attr_accessible :content, :user_id, :appName

  belongs_to :user
  belongs_to :appName, class_name: 'appName'


validates :content, presence: true,
                    length: { minimum: 2 }


validates :appName, presence: true,
                    length: { minimum: 2 }



end
