
get '/send_sms' do
  @user = User.find(session[:user_id])
  reach_count = 0
  error_count = 0
  @user.reaches.where(main_reach: true).each do |reach|
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
        sent_flag = true
        reach_count += 1
    else
      sent_flag = false
      error_count += 1
    end
  end
  if sent_flag
    if count > 1
      flash[:notice] = "Way to go, your #{count} REACHs have been sent!"
    else
      flash[:notice] = "Way to go, your REACH has been sent!"
    end
  else
      flash[:notice] = "Error: #{error_count} REACH(s) did not send"
  end
  # reach = @user.reaches.find_by(main_reach: true)
  # to = reach.contact_phone
  # message = reach.text + " -- Sent by: #{@user.name} via Reach, you can Reach them at #{@user.phone}"
  # client = Twilio::REST::Client.new(
  #   ENV["TWILIO_ACCOUNT_SID"],
  #   ENV["TWILIO_AUTH_TOKEN"]
  # )
  # if client.messages.create(
  #     to: to,
  #     from: "+16502001654",
  #     body: message
  #     )
  #   flash[:notice] = "Woot woot, your REACH has been sent!"
  # else
  #   flash[:notice] = "Error: REACH did not send"
  # end
  redirect '/dashboard'
end

# post '/receive_sms' do
#   content_type 'text/xml'
#   response = Twilio::TwiML::Response.new do |r|
#     r.Message "Thanks for messaging Reach. Please Reach out to #{session[:user:id]}"
# end
