Feature: Maintain Categories
  As a blog administrator
  In order to categorise articles
  I want to be able to create and edit categories

  Background:
    Given the blog is set up
    And I am logged into the admin panel

  Scenario: Successfully add a category
    When I follow "Categories"
    And I fill in "category_name" with "CatFoobar"
    And I fill in "category_keywords" with "Lorem Ipsum"
    And I fill in "category_description" with "Facto"
    And I press "Save"
    Then I should see "CatFoobar"
    And I should see "Facto"
