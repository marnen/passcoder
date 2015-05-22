Feature: Passcode entry link from homepage
  As a user
  I can see a link to the passcode entry page on the homepage
  So I can easily get to the passcode entry page

  Scenario:
    Given I am logged in
    And I am on the home page
    When I click "Enter passcode"
    Then I should be on the passcode entry page
