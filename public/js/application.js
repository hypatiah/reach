$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()

 //  def self.send_sms(client, phone_number, alert_message, image_url)
 //   twilio_number = ENV['TWILIO_NUMBER']
 //   message = client.account.messages.create(
 //     from: twilio_number,
 //     to: phone_number,
 //     body: alert_message,
 //     media_url: image_url
 //   )
 //   puts "An SMS notifying the last application error was "\
 //        "sent to #{message.to[0...-4] + "****"}"
 // end
 showLoginForm();
});

function showLoginForm(){
  $('#login').on("click", function(event){
    event.preventDefault();
    const address = $(this).attr('href');
    const verb = $(this).attr('method');

    var request = $.ajax({
      url: address,
      method: verb
    })

    request.done(function(server_response){
      $('#login_area').html(server_response)
    })

    request.fail(function(){
      alert("Login form rendering error")
      console.log(response_data);
    })
  })
}
