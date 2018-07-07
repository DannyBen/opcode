Feature: Show

Scenario: Run op --list
  Given I am in the "fixtures/advanced" folder
   When I run "op --list"
   Then the output should say "greet   reverse   "
