Feature: Show

Scenario: Run op --show
  Given the variable "EDITOR" is "echo"
   When I run "op edit"
   Then the output should match "op.conf"

