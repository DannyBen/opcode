Feature: What

Scenario: Run op -w for a single line command
  Given I am in the "fixtures/basic" folder
   When I run "op -w hello"
   Then the output should say "echo world"

Scenario: Run op -w for a multiline ommand
  Given I am in the "fixtures/multiline" folder
   When I run "op -w who"
   Then the output should say "echo who ordered this pizza"

Scenario: Run op -w for a code that does not exist
  Given I am in the "fixtures/basic" folder
   When I run "op -w nonono"
   Then the output should say "Code not found: nonono"
    And the exit code should mean failure

Scenario: Run op -w without a code
  Given I am in the "fixtures/basic" folder
   When I run "op -w"
   Then the output should say "Invalid operation"
    And the exit code should mean failure
