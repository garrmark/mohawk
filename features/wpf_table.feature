@wpf
Feature: Working with Telerik RadGridView tables in WPF

  Scenario: Selecting a row by index
    When we select the Telerik grid row with index "1"
    Then the Telerik grid row with index "1" should be selected

  Scenario: Double click a row
    When we double click on a Telerik grid row with index "2"
    Then a dialog box should show with the part id
