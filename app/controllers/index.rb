get '/' do
    erb :index
end

get '/dashboard' do
    @user = User.find(sessions[:user_id])
    erb :dashboard
end
