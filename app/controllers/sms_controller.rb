
get '/send_sms' do
  @user = User.find(session[:user_id])
  reach = @user.reaches.find_by(main_reach: true)
  to = reach.contact_phone
  message = reach.text + " -- Sent by: #{@user.name} via Reach, you can Reach them at #{@user.phone}"
  client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
  )
  if client.messages.create(
      to: to,
      from: "+16502001654",
      body: message
      )
    flash[:notice] = "Woot woot, your REACH has been sent!"
  else
    flash[:notice] = "Error: REACH did not send"
  end
  redirect '/dashboard'
end

# post '/receive_sms' do
#   content_type 'text/xml'
#   response = Twilio::TwiML::Response.new do |r|
#     r.Message "Thanks for messaging Reach. Please Reach out to #{session[:user:id]}"
# end
