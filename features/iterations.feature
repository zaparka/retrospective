Feature: Manage iterations
  In order to add iteration for project
  as a user
  I want CRUD functionality

  Scenario: Register new iteration
    Given project exists with name: "Retrospective"
      And I am on "Retrospective" project page
      And I should see "Retrospective"
    When I follow "New Iteration"
    Then I should be on the new iteration page
      And I fill in "Name" with "IT 1"
      And I select "5 February 2011" as the "iteration_start" date
      And I select "25 February 2011" as the "iteration_end" date
    When I press "Create"
    Then I should see "Iteration was successfully created."
      And I should see "IT 1"
      And I should be on the "IT 1" iteration page

  Scenario: Delete iteration
    Given project exists with name: "Retrospective"
    And the following iterations:
      | name | start      | end        | project       |
      | IT 1 | 2011-01-14 | 2011-02-14 | Retrospective |
      | IT 2 | 2010-02-14 | 2010-03-14 | Retrospective |
      | IT 3 | 2011-03-14 | 2012-04-14 | Retrospective |
      | IT 4 | 2011-04-14 | 2011-05-14 | Retrospective |
    When I delete the 3rd iteration
    Then I should see the following iterations:
      | Name | Start      | End        |
      | IT 1 | 2011-01-14 | 2011-02-14 |
      | IT 2 | 2010-02-14 | 2010-03-14 |
      | IT 4 | 2011-04-14 | 2011-05-14 |
