module SessionsHelper
	def valid_signup(options = {})
		fill_in "Name",         		with: options[:name] 			|| "Example User"
	  fill_in "Email",        		with: options[:email] 		|| "user@example.com"
	  fill_in "Password",     		with: options[:password] 	|| "foobar"
	  fill_in "Confirm Password", with: options[:confirm] 	|| "foobar"
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