post '/send_sms' do
  @user = User.find(session[:user_id])
  reach = @user.reaches.find_by(main_reach: true)
  to = reach.contact_phone
  message = reach.text + " -- sent by: " + @user.username + " via Reach"
  p client = Twilio::REST::Client.new(
    ENV["TWILIO_ACCOUNT_SID"],
    ENV["TWILIO_AUTH_TOKEN"]
  )
  client.messages.create(
    to: to,
    from: "+16502001654",
    body: message
  )
  redirect '/dashboard'
end

# post '/receive_sms' do
#   content_type 'text/xml'
#   response = Twilio::TwiML::Response.new do |r|
#     r.Message "Thanks for messaging Reach. Please Reach out to #{session[:user:id]}"
# end
