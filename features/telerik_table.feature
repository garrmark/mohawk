@telerik
Feature: Working with Telerik RadGridView tables in WPF

  Scenario: Selecting a row by index
    When we select the WPF grid row with index "1"
    Then the WPF grid row with index "1" should be selected

  Scenario: Selecting a row by value
    When we select the WPF grid row with the value "ZZ34334"
    Then the WPF grid row with index "1" should be selected

  Scenario: Double click a row
    When we double click on a WPF grid row value "ZZ34334"
    Then a dialog box should show with the part id
