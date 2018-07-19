Feature: Add command

Scenario: Run op --add
  Given I am in the "tmp" folder
    And the file "op.conf" does not exist
   When I run "op --add say echo say --say -s"
    And I run "op --add shout echo shout"
   Then the file "op.conf" should exist
    And the file "op.conf" should include "say: echo say --say -s"
    And the file "op.conf" should include "shout: echo shout"

