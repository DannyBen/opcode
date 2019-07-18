Feature: Bash Completion
  The commands described in this feature are not directly executed by the
  user, but rather by some other bash tricks, like eval and bash completion
  Nonetheless, they still return output to standard output, and this is what
  is tested here

Background:
  Given I am in the "fixtures/completion" folder

Scenario: Run the installation command
   When I run "op --complete"
   Then the output should say "complete -C 'op --completion' op"

Scenario: Run op only and press tab to cycle through all commands
  Given the variable "COMP_LINE" is "op "
   When I run "op --completion"
   Then the output should match "build\nbash\ncron\ndeploy\ndestroy"

Scenario: Run the completion command with a single match
  Given the variable "COMP_LINE" is "op c"
   When I run "op --completion"
   Then the output should say "cron"
    And the output should not say "build"

Scenario: Run the completion command with multiple matches
  Given the variable "COMP_LINE" is "op b"
   When I run "op --completion"
   Then the output should say "build"
    And the output should say "bash"
    And the output should not say "cron"

Scenario: Run the completion command in a folder without op.conf
  Given the variable "COMP_LINE" is "op "
    And I am in the "../" folder
   When I run "op --completion"
   Then the output should be ""
