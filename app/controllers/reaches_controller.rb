get '/reaches/all' do
  @user = User.find(session[:user_id])
  erb :'reaches/index'
end

get '/reaches/new' do
  erb :'reaches/new'
end

post '/reaches/new' do

end

get '/reaches/:id' do
  @reach = Reach.find(params[:id])
  erb :'reaches/show'
end

get '/reaches/:id/edit' do
  @reach = Reach.find(params[:id])
  erb :'reaches/edit'
end

post '/reaches/:id/delete' do
  @reach = Reach.find(params[:id])
  @reach.destroy
  redirect '/reaches/all'
end
