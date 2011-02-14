Feature: Manage projects
  In order to create project
  as an user
  I want CRUD functionality for projects

  Scenario: Register new project
    Given I am on the new project page
      And I fill in "Name" with "Thankerino"
      And I press "Create"
    Then I should see "Project was successfully created."
      And I should be on "Thankerino" project page

  Scenario: Editing project
    Given project exist with name: "Thankerino"
      And I am on the projects page
      And I should see the following projects:
        |Name|
        |Thankerino|
      And I follow "Edit"
      And I should be on the edit page for "Thankerino" project
      And I fill in "Name" with "Retrospective"
    When I press "Update Project"
    Then should be on "Retrospective" project page
      And I should see "Project was successfully updated."

  Scenario: Delete project
    Given the following projects:
      | name          |
      | Thankerino    |
      | Retrospective |
      | Timesheets    |
      | Osgood        |
    When I delete the 3rd project
    Then I should see the following projects:
      | Name          |
      | Thankerino    |
      | Retrospective |
      | Osgood        |
