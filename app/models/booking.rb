class Booking < ActiveRecord::Base
	belongs_to :property
	belongs_to :user
	
	validates :start_date, presence: true
	validates :end_date, presence:true
end