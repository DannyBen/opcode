Feature: Add command

Scenario: Run op --add
  Given I am in the "tmp" folder
    And the file "op.conf" does not exist
   When I run "op --add say echo say --say -s"
    And I run "op --add shout echo shout"
   Then the output should say "shout: echo shout"
    And the file "op.conf" should exist
    And the file "op.conf" should include "say: echo say --say -s"
    And the file "op.conf" should include "shout: echo shout"

Scenario: Run op --add without arguments
  Given I am in the "tmp" folder
    And the file "op.conf" does not exist
   When I run "op --add"
   Then the output should say "Invalid operation"
    And the file "op.conf" should not exist

