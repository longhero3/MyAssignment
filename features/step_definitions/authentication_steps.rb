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
  @user=FactoryGirl.create(:user, :confirmed_at => DateTime.now)
end
When /^he submits valid username and password$/ do
  fill_in "username", :with => @user.username
  fill_in "password", :with => @user.password
  click_button "Log in"
end
Then /^he should see the store page$/ do
  page.should have_selector('strong', :text => "Welcome")

end
Then /^he should see sign out link$/ do
  save_and_open_page
  page.should have_link('Logout')
end