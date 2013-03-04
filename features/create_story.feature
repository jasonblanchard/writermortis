Feature: Create a Story
    As a writer
    So that I can practice writing
    I want to create a story

    Background:
        Given the following users exist:
            | email             | password  | name  |
            | test@example.com  | testpass  | test  |
        Given I am logged in

    Scenario:
        Given I am on the homepage
        And I click "New Story"
        And I fill in "story_title" with "Hello World Story"
        And I push "Create Story"
        Then I should see "Hello World Story"
