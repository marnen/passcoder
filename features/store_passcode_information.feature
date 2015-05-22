Feature: Store passcode information
  As a user
  I can enter the items that a passcode yields
  So other users can tell what the code does without redeeming it

Background:
  Given I am logged in
  And no passcodes exist

Scenario Outline: Save passcode AP and XM
  Given I am on the passcode entry page
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

Scenario Outline: Save passcode gear
  Given an item exists named "<item>"
  And I am on the passcode entry page
  When I fill in the following:
    | Passcode | <passcode> |
    | Item     | <item>     |
    | Level    | <level>    |
    | Quantity | <quantity> |
  And I click "Save"
  Then I should be on the passcode index page
  And I should see the following passcode:
    | code                  | <passcode> |
    | <abbreviation><level> | <quantity> |

  Examples:
    | passcode | item        | abbreviation | level | quantity |
    | xyz987   | Resonator   | R            | 3     | 6        |
    | 123abc   | XMP Burster | X            | 2     | 10       |
