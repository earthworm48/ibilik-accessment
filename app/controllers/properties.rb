# Create new properties
post '/properties' do
	# byebug
	@property = Property.create(title: params[:title], description: params[:description], user_id: session[:user_id])
	# byebug
	redirect "/properties/#{@property.id}"
end

get '/properties' do
	erb :"properties/all"
end

# Go to new properties page
get '/properties/new' do
	erb :"properties/new"
end

# properties profile page
get '/properties/:property_id' do
	# byebug
	@user = User.find(session[:user_id])
	@property = Property.find(params[:property_id])
	
	erb :"properties/home"
end

# Edit properties
get '/properties/:property_id/edit' do
	@property = Property.find(params[:property_id])
	erb :"properties/edit"
end

# Update properties
patch "/properties/:property_id" do
	property = Property.find(params[:property_id])
	property.update(title: params[:title],description: params[:description])
	redirect "/properties/#{property.id}"
end

# Delete properties
delete "/properties/:property_id" do
	property = Property.find(params[:property_id])
	property.destroy
	redirect "/users/#{session[:user_id]}" 	
end