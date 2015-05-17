Feature: Store passcode information
  As a user
  I can enter the items that a passcode yields
  So other users can tell what the code does without redeeming it

Scenario: Passcode entry link from homepage
  Given I am logged in
  And I am on the home page
  When I click "Enter passcode"
  Then I should be on the passcode entry page
