class LoginForm
	include Capybara::DSL

	def visit_page
		visit('/registrations')
		self
	end
	

	def register_as(user)
		fill_in("Email", with: user.email)
		fill_in('Username', with: user.username)
		fill_in("Password", with: user.password)
		fill_in("Password confirmation", with: user.password)
		click_on 'Create account'
		self
	end
	def submit
		click_on 'Create account'
		self
	end

	def fill_in_with(params = {})
		fill_in 'Email', with: "art@mail.ru"
	  fill_in "Username", with: "art"
	  fill_in "Password", with: 'password'
	  fill_in "Password confirmation", with: 'password'
		self
	end
end