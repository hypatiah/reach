get '/users/new' do
    erb :'users/new'
end

post '/users/new' do
    if params[:password1] == params[:password2]
        @user = User.new(name: params[:name], email: params[:email], phone: params[:phone], password: params[:password2])
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
