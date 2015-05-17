Feature: Store passcode information
  As a user
  I can enter the items that a passcode yields
  So other users can tell what the code does without redeeming it

Background:
  Given I am logged in

Scenario: Passcode entry link from homepage
  Given I am on the home page
  When I click "Enter passcode"
  Then I should be on the passcode entry page

Scenario Outline: Save passcode information
  Given no passcodes exist
  And I am on the passcode entry page
  When I fill in the following:
    | Passcode | <passcode> |
    | XM       | <xm>       |
  And I click "Save"
  Then I should be on the passcode index page
  And I should see passcode "<passcode>" with <xm> XM

  Examples:
    | passcode | xm  |
    | 1a2b3c   | 200 |
