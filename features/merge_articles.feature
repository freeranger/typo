Feature: Merge Articles
  As a blog administrator
  In order to avoid multiple similar articles
  I want to be able to add articles to my blog

  Background:
    Given the blog is set up
    And the following articles exist
      | id | title    | body        |  
      | 2  | Foobar   | LoremIpsum  |  
      | 3  | Foobar2  | LoremIpsum2 |  

  Scenario: Successfully merge articles
    Given I am logged into the admin panel as an admin
    And I am on the article page for "Foobar"
    And I fill in "merge_with" with "3"
    And I press "Merge"
    When I go to the home page
    Then I should see "Foobar"
    When I follow "Foobar"
    Then I should see "Lorem Ipsum"
    Then the article "Foobar" should have body "LoremIpsumLoremIpsum2"

Scenario: The merge form is not visible for new articles
    Given I am logged into the admin panel as an admin
    When I go to the new article page
    Then I should not see "Merge Articles"

Scenario: The merge form is visible for editing articles when I am an admin
    Given I am logged into the admin panel as an admin
    When I go to the article page for "Foobar"
    Then I should see "Merge Articles"

  Scenario: A non-admin cannot merge two articles
    Given I am logged into the admin panel as an author
    When I go to the article page for "Foobar"
    Then I should not see "Merge Articles"
