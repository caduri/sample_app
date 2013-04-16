module SessionsHelper
	def valid_signup()
		fill_in "Name",         with: "Example User"
	  fill_in "Email",        with: "user@example.com"
	  fill_in "Password",     with: "foobar"
	  fill_in "Confirmation", with: "foobar"
	end

	def valid_signin(user, options = {})
		if options[:visit]
			visit options[:visit]
		else
			visit signin_path
		end
		
	  fill_in "Email",    with: user.email
	  fill_in "Password", with: user.password
	  click_button "Sign in"
	  # Sign in when not using Capybara as well.
	  cookies[:remember_token] = user.remember_token
	end
end