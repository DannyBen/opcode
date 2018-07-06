Feature: Version

Scenario: Run op --version
   When I run "op --version"
   Then the output should match "\d+\.\d+\.\d+"
