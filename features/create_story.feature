Feature: Create a Story
    As a writer
    So that I can practice writing
    I want to create a story

    Background:
        Given the following users exist:
            | email             | password  | name  |
            | test@example.com  | testpass  | test  |

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
