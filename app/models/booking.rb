class Booking < ActiveRecord::Base
	belongs_to :property
	belongs_to :user
	
	validates :start_date, presence: true
	validates :end_date, presence:true

	validate :end_after_start

	def end_after_start
	  return if end_date.blank? || start_date.blank?
	 
	  if end_date < start_date
	    errors.add(:end_date, "must be after the start date") 
	  end 
	end
	
end