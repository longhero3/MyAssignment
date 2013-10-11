Feature: Login
  Background:
    Given the page has one category 
    And the user visits the login page

  Scenario: Invalid info Login
    When he submits invalid username or password
    Then he should see the error message "Wrong Username or Password"

  Scenario: Inactivated login 
    Given he has inactivated account
    When he submits with inactivated account
    Then he should see the error message "Your account has not been activated"  

  Scenario: Successful Login
    Given he has an account
    When he submits valid username and password
    Then he should see the store page
    And he should see sign out link
