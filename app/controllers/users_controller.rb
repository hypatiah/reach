get '/users/new' do
    erb :'users/new'
end

post '/users/new' do
    p params
    if params[:password1] == params[:user]['password']
        @user = User.new(params[:user])
        if @user.save
            login(@user)
            redirect '/dashboard'
        elsif User.find_by(email: @user.email)
            @error = 'Sorry, email already exits'
            erb :'/users/new'
        else p "not rendering errors"
        end
    else @error = "Sorry, passwords don't match"
         erb :'/users/new'
    end
end

get '/dashboard' do
    @user = User.find(session[:user_id])
    erb :dashboard
end
