Feature: User can register for their new accounts
  In order to login to the system 
  As a user
  I want to register an account 
  Background:
    Given the user visits the register page 

  Scenario Outline:: User enters invalid info 
    Given the user fills the form with info <username>,<password>,<password_confirmation>,<full_name>,<email>,<phone> 
    When the user clicks on the signup button 
    Then the user should see the "<error>" message
    Examples:
      |username|password|password_confirmation|full_name      |email               |phone|error                              |
      |        |123     |123                  |Dang Hoang Long|s3324816@rmit.edu.vn|31223|Username can't be blank            |
      |long    |        |123                  |Dang Hoang Long|s3324816@rmit.edu.vn|31223|Password doesn't match confirmation|
      |long    |123     |                     |Dang Hoang Long|s3324816@rmit.edu.vn|31223|Password doesn't match confirmation|
      |long    |123     |123                  |               |s3324816@rmit.edu.vn|31223|Full name can't be blank           |
      |long    |123     |123                  |Dang Hoang Long|                    |31223|Email can't be blank               |

