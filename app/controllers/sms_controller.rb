# post '/send_sms' do
#   p params
#   to = params[:contact_phone]
#   message = params[:text]
#   p client = Twillio::REST::Client.new(
#     ENV["TWILIO_ACCOUNT_SID"],
#     ENV["TWILIO_AUTH_TOKEN"]
#   )
#   client.messages.create(
#     to: to,
#     from: "+12155844169"
#     body: message
#   )
# end

# post '/receive_sms' do
#   content_type 'text/xml'
#   response = Twilio::TwiML::Response.new do |r|
#     r.Message "Thanks for messaging Reach. Please Reach out to #{session[:user:id]}"
# end
