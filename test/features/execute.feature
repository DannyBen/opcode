Feature: Execute

Scenario: Run a basic command
  Given I am in the "fixtures/basic" folder
   When I run "op hello"
   Then the output should say "world"

Scenario: Run an invalid command
  Given I am in the "fixtures/basic" folder
   When I run "op nocommand"
   Then the output should say "Code not found: nocommand"
    And the exit code should mean failure

Scenario: Run in a folder without op.config
  Given I am in the "fixtures" folder
   When I run "op nocommand"
   Then the output should say "Cannot find op.conf"
    And the exit code should mean failure

Scenario: Run a command with arguments
  Given I am in the "fixtures/advanced" folder
   When I run "op greet Lloyd"
   Then the output should say "Hello Lloyd"

Scenario: Run a command with positional quoted arguments
  Given I am in the "fixtures/advanced" folder
   When I run "op reverse 'Lloyd Christmas' 'Harry Dunne'"
   Then the output should say "Harry Dunne and Lloyd Christmas"

