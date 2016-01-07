Feature: test out the app

  In order to make sure the database has data
  As a user of the application
  I want the database objects to be non-zero

  Scenario: test database
    Given some data
    When load the data into variables
    Then I should see non-zero sizes of the variables
