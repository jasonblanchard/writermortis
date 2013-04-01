Feature: Create a Story
    As a writer
    So that I can practice writing
    I want to create a story

    Background:
        Given the following users exist:
            | email             | password  | name  |
            | test@example.com  | testpass  | test  |
            | sally@example.com | testpass  | sally |

        Given I am logged in

        Given the following stories exist:
            | Title             | Max Sentences | Total Slices  | author    |
            | Call of Cthulhu   | 5             | 3             | test      |

    Scenario: Create a story
        Given I am on the homepage
        And I click "New Story"
        And I fill in "story_title" with "Hello World Story"
        And I push "Create Story"
        Then I should see "Hello World Story"
        And I should see "Each contribution must be less than 5 sentences."
        And I should see "The story will be finished when there are 7 contributions."
        And I should see "test"

    Scenario: Editing a story
        Given I am on the "Call of Cthulhu" story page
        And I click "[Edit Story]"
        And I fill in "story_title" with "Shmall of Cthulhu"
        And I push "Update Story"
        Then I should see "Shmall of Cthulhu"

    Scenario: Users cannot edit others users stories
        Given I am logged out
        And "sally@example.com" is logged in
        And I am on the "Call of Cthulhu" story page
        Then I should not see "[Edit Story]"

    Scenario: User deletes story
        Given I am logged out
        Given I am on the homepage
        Given I am logged in
        And I am on the "Call of Cthulhu" story page
        And I click "[Edit Story]"
        And I click "Delete Story"
        Then I should see "Story deleted."

    Scenario: User creates story with a slice
        Given I am on the homepage
        And I click "New Story"
        And I fill in "story_title" with "Inline Story Slice"
        And I fill in "story_slices_attributes_0_body" with "This is the first part"
        And I push "Create Story"
        Then I should see "This is the first part"

    Scenario: 
        Given I am on the "Call of Cthulhu" story page
        And I click "Edit Story"
        Then I should not see the "story_slices_attributes_0_body" field
