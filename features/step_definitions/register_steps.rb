Given /^the user visits the register page$/ do
  visit new_user_path
end
Given /^the user fills the form with info (.*),(.*),(.*),(.*),(.*),(.*)$/ do |username,password,password_confirmation,
	full_name,email,phone|
  fill_in "user_username", :with => username
  fill_in "user_password", :with => password
  fill_in "user_password_confirmation", :with => password_confirmation
  fill_in "user_email", :with => email 
  fill_in "user_full_name", :with => full_name
  fill_in "user_phone", :with => phone
end
When /^the user clicks on the signup button$/ do 
  click_button "Signup"
end
Then /^the user should see the "(.*)" message$/ do |message|
  expect(page).to have_content(message)
end