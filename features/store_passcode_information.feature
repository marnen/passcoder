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

Scenario Outline: Save passcode AP and XM
  Given no passcodes exist
  And I am on the passcode entry page
  When I fill in the following:
    | Passcode | <passcode> |
    | <field>  | <value>    |
  And I click "Save"
  Then I should be on the passcode index page
  And I should see the following passcode:
    | code    | <passcode> |
    | <field> | <value>    |

  Examples:
    | passcode | field | value |
    | 5tesla2  | AP    | 150   |
    | 1a2b3c   | XM    | 200   |

Scenario Outline: Save passcode resonators
  Given no passcodes exist
  And I am on the passcode entry page
  When I fill in the following:
    | Passcode           | <passcode> |
    | Resonator level    | <level>    |
    | Resonator quantity | <quantity> |
  And I click "Save"
  Then I should be on the passcode index page
  And I should see the following passcode:
    | code     | <passcode> |
    | R<level> | <quantity> |

  Examples:
    | passcode | level | quantity |
    | xyz987   | 3     | 6        |
