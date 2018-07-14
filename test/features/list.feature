Feature: List

Scenario: Run op in a folder with op.conf
  Given I am in the "fixtures/basic" folder
   When I run "op"
   Then the output should say "hello   who   "

Scenario: Run op --list
  Given I am in the "fixtures/advanced" folder
   When I run "op --list"
   Then the output should say "greet   reverse   "
