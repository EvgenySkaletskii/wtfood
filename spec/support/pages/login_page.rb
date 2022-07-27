class LoginPage < SitePrism::Page
  set_url "/"

  element :email_field, "#user_email"
  element :password_field, "#user_password"
  element :submit_button, "input[value='Continue']"
end
