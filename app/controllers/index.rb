get '/' do
    erb :index
end

get '/dashboard' do
    @user = User.create(username: params[:username], email: params[:email], password: params[:password])
    erb :dashboard
end
