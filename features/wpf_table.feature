@wpf
Feature: Working with Telerik RadGridView tables in WPF

  Scenario: Selecting a row by index
    When we select the Telerik grid row with index "1"
    Then the Telerik grid row with index "1" should be selected
