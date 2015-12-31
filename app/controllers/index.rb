get '/' do
  erb :index
end


post '/login' do
	byebug	
	user = User.find_by_email(params[:user][:email])
	if user.authenticate(params[:user][:password])
		session['user_id'] = user.id
		redirect '/success'
	else
		redirect '/'
	end
end

post '/sign_in' do
	user = User.new(params[:user])
	user.save

	redirect '/'
end

get '/success' do
	user = User.find_by_id(session['user_id'])
	if user
		"success"
	else
		redirect '/'
	end
end

get '/logout' do
	session['user_id'] = ""
	'logged out'
end