# Create new user
post '/users' do
	@user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		erb :"static/index"
	end
end

get "/users/:user_id" do
	@user = User.find(params[:user_id])
	erb :"users/profile"
end

post '/users/login' do
	@user = User.find_by(email: params[:email]) 
	if @user.nil?
		@error = "No such email address"
		@user = User.new
		erb :"static/index"
	elsif @user.authenticate(params[:password])	
		session[:user_id] = @user.id
		redirect "/users/#{session[:user_id]}"
	else
		@error = "Wrong combination of e-mail and password"
		erb :"static/index"
	end
end

# Log out users
get "/users/:id/logout" do
	session[:user_id] = nil
	redirect "/"
end