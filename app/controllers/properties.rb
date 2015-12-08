# Create new properties
post '/properties' do
	# byebug
	@property = Property.create(title: params[:title], description: params[:description], user_id: session[:user_id])
	# byebug
	redirect "/properties/#{@property.id}"
end

# Go to new properties page
get '/properties/new' do
	erb :"properties/new"
end

# properties profile page
get '/properties/:property_id' do
	@user = User.find(session[:user_id])
	@property = Property.find(params[:property_id])
	
	erb :"properties/home"
end


# Edit properties
get '/properties/:property_id/edit' do
	@properties = Property.find(params[:property_id])
	erb :"properties/edit"
end

# Update properties
patch "/properties/:property_id" do
	properties = properties.find(params[:property_id])
	properties.update(title: params[:title])
	redirect "/properties/#{properties.id}"
end

# Delete properties
delete "/properties/:property_id" do
	properties = properties.find(params[:property_id])
	# byebug
	properties.destroy
	redirect "/users/#{session[:user_id]}" 	
end