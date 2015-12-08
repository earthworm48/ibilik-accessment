class Property < ActiveRecord::Base
	belongs_to :user
	has_many :comments
	has_many :bookings
	
	validates :title, presence: true
	validates :description, presence: true
end