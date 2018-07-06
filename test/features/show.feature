Feature: Show

Scenario: Run op --show
  Given I am in the "fixtures/basic" folder
   When I run "op --show"
   Then the output should be like "op.conf"
