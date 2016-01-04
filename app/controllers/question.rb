get '/questions' do
	session['user_id'] = 1
	@user = User.find(session[:user_id])
	@questions = Question.all
	@my_questions = @user.questions
	erb :question_index
end

get '/question/:id' do
	@question = Question.find(params[:id])
	@user = @question.user
	erb :'/show'
end

get '/questions/new' do
	erb :'/new'
end

get '/question/:id/edit' do
	@question = Question.find(params[:id])
	erb :'edit'
end

post '/questions' do
	@user = User.find(session[:user_id])
	@question = @user.questions.new(params[:question])

	if @question.save
		redirect "/question/#{@question.id}"
	else
		erb :new
	end
end

post '/questions/:id/edit' do
	@question = Question.find(params[:id])
	@question.update(params[:question])

	redirect "/question/#{@question.id}"
end

post '/question/:id' do
	byebug
	@question = Question.find(params[:id])
	@question.delete

end



post '/question/:question_id/answer/new'