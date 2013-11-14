class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me,
  					:first_name, :last_name, :profile_name
  # attr_accessible :title, :body

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true,
                           uniqueness: true,
                           format: {
                            with: /^[a-zA-Z0-9_-]+$/,
                            message: "May not contain spaces or special characters."
                           }
  # validates :email, format: {
  #                          with: /@mercy.edu/,
  #                         message: "Must be a mercy.edu or mercymavericks account."
  #                        }


  has_many :statuses
  has_many :user_friendships
  has_many :friends, through: :user_friendships

    def full_name
    	first_name + " " + last_name
    end

    def to_param
      profile_name
    end


    def gravatar_url
      stripped_email = email.strip
      downcased_email = stripped_email.downcase
      hash = Digest::MD5.hexdigest(downcased_email)

      "http://gravatar.com/avatar/#{hash}d=http://cdn.hiconsumption.com/wp-content/uploads/2013/06/Faces-Scribble-Portraits-by-Vince-Low-0.jpg"

  end
end