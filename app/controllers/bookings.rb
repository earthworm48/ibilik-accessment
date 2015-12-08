# Create new bookings
post '/bookings' do
	@booking = Booking.create(start_date: params[:start_date], end_date: params[:end_date],user_id: session[:user_id], property_id: params[:property_id])
	redirect "/users/#{session[:user_id]}"
end

# Edit bookings
get '/bookings/:booking_id/edit' do
	@booking = Booking.find(params[:booking_id])
	erb :"bookings/edit"
end

# Update bookings
patch "/bookings/:booking_id" do
	booking = Booking.find(params[:booking_id])
	booking.update(start_date: params[:start_date], end_date: params[:end_date])
	redirect "/users/#{booking.user.id}"
end

# Delete bookings
delete "/bookings/:booking_id" do
	booking = Booking.find(params[:booking_id])
	booking.destroy
	redirect "/users/#{booking.user.id}" 	
end