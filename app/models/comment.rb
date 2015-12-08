class Comment < ActiveRecord::Base
	belongs_to :property
	belongs_to :user
	
	validates :description, presence: true
end