class User < ActiveRecord::Base
	# include BCrypt
	validates :email, uniqueness: true
	validates_format_of :email, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i
	validates :password, length: {minimum: 8}
	validates_confirmation_of :password 
	# :message => "should match confirmation"
	has_many :properties
	has_many :comments
	has_many :bookings
	
	has_secure_password validations: false

end