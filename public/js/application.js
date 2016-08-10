$(document).ready(function() {
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
