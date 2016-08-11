$(document).ready(function() {
 showLoginForm();
 showLoginError();
});

function showLoginForm(){
  $('#login').on('click', function(event){
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
      alert("Error: login form rendering invalid")
      console.log(server_response);
    })
  })
}

function showLoginError(){
  $('#login_area').on('submit', '#mini_log', function(){
    event.preventDefault();

    var formData = $('#mini_log').serialize();
    const address = $('#mini_log').attr('action');
    const verb = $('#mini_log').attr('method');

    var request = $.ajax({
      url: address,
      method: verb,
      data: formData
    })

    request.done(function(server_response){
      if (server_response.redirectURL){
        window.location = server_response.redirectURL;
      }
      else {$('#login_area').html(server_response)}
    })

    request.fail(function(){
      alert("Error: cannot load invalid input message")
      console.log(server_response)
    })
  })
}
