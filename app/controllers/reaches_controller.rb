get '/reaches/all' do
  @user = User.find(session[:user_id])
  erb :'reaches/index'
end

get '/reaches/new' do
  erb :'reaches/new'
end

post '/reaches/new' do
  @reach = Reach.new(user_id: session[:user_id], contact_name: params[:contact_name], contact_phone: params[:contact_phone], text: params[:text], label: params[:label], main_reach: params[:main_reach])
  if @reach.save
    redirect '/reaches/all'
  else
    @error = "Sorry, invalid input. Phone number and Text fields are required"
    erb :'reaches/new'
  end
end

get '/reaches/:id' do
  @reach = Reach.find(params[:id])
  erb :'reaches/show'
end

get '/reaches/:id/edit' do
  @reach = Reach.find(params[:id])
  erb :'reaches/edit'
end

put '/reaches/:id' do
  @reach = Reach.find(params[:id])
  # p "*" * 20
  # p params
  @reach.update(params[:reach])
  @user = User.find(session[:user_id])
  # p "* " * 20
  # p @user.reaches.where(main_reach: true)
  if params[:reach]['main_reach'] == "on"
    @user.reaches.where(main_reach: true).each do |reach|
      reach.main_reach = false
      reach.save
    end
    @reach.main_reach = true
  else
    @reach.main_reach = false
  end
  @reach.save
  redirect "/reaches/#{@reach.id}"
end

delete '/reaches/:id' do
  @reach = Reach.find(params[:id])
  @reach.destroy
  redirect '/reaches/all'
end
