Feature: Edit

Scenario: Run op --edit
  Given the variable "EDITOR" is "echo"
   When I run "op --edit"
   Then the output should match "op.conf"

