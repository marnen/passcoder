Feature: User login
  As the system
  I let only authorized users log in and see data
  So I have some control over who's doing what

Scenario Outline:
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
