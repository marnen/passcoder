Feature: User registration and login
  As the system
  I let only authorized users log in and see data
  So I have some control over who's doing what

Scenario Outline: User registration
  Given no users exist
  And I am on the user registration page
  When I fill in the following:
    | Email                 | <email>    |
    | Password              | <password> |
    | Password confirmation | <password> |
  And I click "Sign up"
  Then I should see "You have signed up successfully."
  And the following user should exist:
    | email    | <email>    |
    | password | <password> |

  Examples:
    | email           | password |
    | joe@example.com | passw0rð |

Scenario Outline: User login
  Given I am not logged in
  And the following user exists:
    | email    | <email>    |
    | password | <password> |
  And I am on the home page
  When I go to the login page
  # TODO: change field name to E-mail when we customize
  And I fill in the following:
    | Email    | <email>    |
    | Password | <password> |
  And I click "Log in"
  Then I should be logged in

  Examples:
    | email           | password |
    | joe@example.com | passw0rð |
