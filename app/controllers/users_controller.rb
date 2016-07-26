
get '/users/new' do
    erb :'users/new'
end

post '/users/new' do
    if params[:password1] == params[:password2]
        @user = User.new(username: params[:username], email: params[:email], password: params[:password2])
        if @user.save
            login(@user)
            redirect '/dashboard'
        elsif User.find_by(username: @user.username)
            @error = 'Sorry, username already exits'
            erb :'/users/new'
        elsif User.find_by(email: @user.email)
            @error = 'Sorry, email already exits'
            erb :'/users/new'
        else p "not rendering errors"
        end
    else @error = "Sorry, passwords don't match"
         erb :'/users/new'
    end
end
