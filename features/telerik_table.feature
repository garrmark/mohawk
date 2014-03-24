@telerik
Feature: Working with WPF DataGrid

  Scenario: Selecting a row by index
    When we select the WPF grid row with index "1"
    Then the WPF grid row with index "1" should be selected

  Scenario: Selecting a row by value
    When we select the WPF grid row with the value "ZZ34334"
    Then the WPF grid row with index "1" should be selected

  Scenario: Selecting a row by matching cell information
    When we select the WPF grid row with the following information:
      | partid     | description | quantity |
      | XX123 | Test Part 1      | 5         |
    Then the row with index "1" should be selected

  Scenario: Double click a row
    When we double click on a WPF grid row value "ZZ34334"
    Then a dialog box should show with the part id