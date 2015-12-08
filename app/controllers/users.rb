# Create new user
post '/users' do
	# encrypted_password = BCrypt::Password.create(params[:password])
	# byebug
	@user = User.new(name: params[:name], email: params[:email], password: params[:password], password_confirmation: params[:password_confirmation])
	if @user.save
		session[:user_id] = @user.id
		redirect "/users/#{@user.id}"
	else
		erb :"static/index"
	end
end