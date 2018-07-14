Feature: Usage and Help

Scenario: Run op in a folder without op.conf
   When I run "op"
   Then the output should say "Usage:"
    And the output should not say "Show this message"

Scenario: Run op --help
   When I run "op --help"
   Then the output should say "Usage"
    And the output should say "Show this message"
