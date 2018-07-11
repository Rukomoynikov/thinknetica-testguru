document.addEventListener('turbolinks:load', function() {

  var password_input = document.querySelector("[name='user[password]']")
  var password_confirmation_input = document.querySelector("[name='user[password_confirmation]']")

  if (password_input && password_confirmation_input) { 
    password_input.addEventListener('input', comparePasswords)

    password_confirmation_input.addEventListener('input', comparePasswords)
  }

  function comparePasswords () {
    if (password_confirmation_input.value == '') return
  
    if (password_input.value == password_confirmation_input.value ) {
      password_input.className = 'input--correct'
      password_input.className = 'input--correct'
    } else {
      password_confirmation_input.className = 'input--error'
      password_confirmation_input.className = 'input--error'
    }
  }
  
})
