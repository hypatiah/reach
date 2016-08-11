get '/sessions/new' do
    if request.xhr?
      erb :'sessions/_new', layout: false
    else
      erb :'sessions/new'
    end
end

post '/sessions/new' do
    @user = User.authenticate(params[:email], params[:password])
    if request.xhr?
      if @user
        login(@user)
        content_type :json
        { redirectURL: '/dashboard' }.to_json
      else
        @error = 'Email or password invalid'
        erb :'sessions/_new', layout: false
      end
    else
      if @user
          login(@user)
          redirect '/dashboard'
      else
          @error = 'Email or password invalid'
          erb :'sessions/new'
      end
    end
end

get '/sessions/delete' do
    session[:user_id] = nil
    redirect '/'
end
