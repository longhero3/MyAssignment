Feature: Login
  Scenario: Unsuccessful Login
    Given the user visits the login page
    When he submits invalid username or password
    Then he should see the error message
  Scenario: Successful Login
    Given the user visits the login page
    And he has an account
    When he submits valid username and password
    Then he should see the store page
    And he should see sign out link