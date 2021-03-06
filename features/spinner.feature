Feature:  Spinner controls

  Scenario: Getting and setting spinner values
    Then I can set the spinner to "50.8"

  Scenario: Incrementing the spinner
    When the spinner is set to "10.0"
    Then we can crank it up to "11.0"

  Scenario: Decrementing the spinner
    When the spinner is set to "40.3"
    Then we can knock it down to "39.3"
