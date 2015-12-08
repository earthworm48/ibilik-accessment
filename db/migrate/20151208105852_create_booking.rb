class CreateBooking < ActiveRecord::Migration
	def change
		create_table :bookings do |t|
			t.string :start_date
			t.string :end_date
			t.integer :user_id
			t.integer :property_id

			t.timestamps null:false
		end
	end
end
