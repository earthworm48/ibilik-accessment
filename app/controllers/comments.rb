# Create new comments
post '/comments' do
	# byebug
	@comment = Comment.create(description: params[:description], user_id: session[:user_id], property_id: params[:property_id])
	# byebug
	redirect "/properties/#{@comment.property.id}"
end

# Edit comments
get '/comments/:comment_id/edit' do
	@comment = Comment.find(params[:comment_id])
	erb :"comments/edit"
end

# Update comments
patch "/comments/:comment_id" do
	comment = Comment.find(params[:comment_id])
	comment.update(description: params[:description])
	redirect "/properties/#{comment.property.id}"
end

# Delete comments
delete "/comments/:comment_id" do
	comment = Comment.find(params[:comment_id])
	comment.destroy
	redirect "/properties/#{comment.property.id}" 	
end