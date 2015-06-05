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
  Given the following items exist:
    | name   | abbreviation   |
    | <item> | <abbreviation> |
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

Scenario Outline: Save multiple line items per passcode
  Given the following items exist:
    | name    | abbreviation |
    | <item1> | <abbr1>      |
    | <item2> | <abbr2>      |
  And I am on the passcode entry page
  When I fill in the following:
    | Passcode | <passcode>  |
    | Item     | <item1>     |
    | Level    | <level1>    |
    | Quantity | <quantity1> |
  And I click "Add item"
  And I fill in the following for the last line item:
    | Item     | <item2>     |
    | Level    | <level2>    |
    | Quantity | <quantity2> |
  And I click "Save"
  Then I should be on the passcode index page
  And I should see the following passcode:
    | code            | <passcode>  |
    | <abbr1><level1> | <quantity1> |
    | <abbr2><level2> | <quantity2> |

  Examples:
    | passcode | item1        | abbr1 | level1 | quantity1 | item2      | abbr2 | level2 | quantity2 |
    | 1multi5a | Ultra Strike | U     | 1      | 10        | Power Cube | C     | 2      | 20        |

Scenario Outline: Return to form on error, with line items still populated
  Given the following items exist:
    | name   |
    | <item> |
  And I am on the passcode entry page
  When I fill in the following:
    | Item     | <item>     |
    | Quantity | <quantity> |
  And I click "Save"
  Then I should see "can't be blank"
  And I should see the following form fields:
    | Item     | <item>     |
    | Quantity | <quantity> |

  Examples:
    | item            | quantity |
    | Turret          | 5        |

Scenario: Return to form on error with at least 1 line item
  Given I am on the passcode entry page
  When I click "Save"
  Then I should see "can't be blank"
  And I should see the following form fields:
    | Item     | Choose an item… |
    | Quantity | 1               |
