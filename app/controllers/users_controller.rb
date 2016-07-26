get '/users/new' do
    erb :'users/new'
end

post '/users/new' do
    if params[:password1] == params[:password2]
        @user = User.new(username: params[:username], email: params[:email], password: params[:password2])
    else @error = "Sorry, passwords don't match"
         erb :'/users/new'
    end
    if @user.save
        login(@user)
        redirect '/dashboard'
    elsif @user.username == User.find_by(username: @user.username)
        @error = 'Sorry, username already exits'
        erb :'/users/new'
    elsif @user.email == User.find_by(email: @user.email)
        @error = 'Sorry, email already exits'
        erb :'/users/new'
    end
end
