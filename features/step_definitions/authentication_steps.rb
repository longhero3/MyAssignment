Given /^the user visits the login page$/ do
  visit login_path
end
When /^he submits invalid username or password$/ do
  click_button "Log in"
end
Then /^he should see the error message$/ do
  expect(page).to have_selector("div.alert.alert-danger")
end
Given /^he has an account$/ do 
  @user=FactoryGirl.create(:confirmed_user)
end
When /^he submits valid username and password$/ do
  fill_in "Username",    with: @user.username
  fill_in "Password", with: @user.password
  click_button "Log in"
end
Then /^he should see the store page$/ do
  expect(page).to have_selector("div#store")
end
Then /^he should see sign out link$/ do
  expect(page).to have_link('Logout', href: logout_path)
end