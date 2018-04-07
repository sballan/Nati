class User < ApplicationRecord
	has_many :posts
	has_one :profile
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
				 :recoverable, :rememberable, :trackable, :validatable
				 
	validates_presence_of :first_name, :last_name
	
	def full_name
		"#{first_name} #{last_name}"
	end

	def list_name
		"#{last_name.upcase}, #{first_name.upcase}"
	end

end
