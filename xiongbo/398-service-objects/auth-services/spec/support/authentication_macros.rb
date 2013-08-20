module AuthenticationMacros
  def login(options = {})
    user = create(:user, options)
    visit login_path
    fill_in "Username", with: user.username
    fill_in "Password", with: user.password
    click_button "Log In"
    user
  end
end
