Feature: Add slice to a story
    As a contributor
    So that I can have fun with a story
    I want to add a slice to a story

    Background:
        Given the following stories exist:
            | Title             | Max Sentences | Total Slices  |
            | Call of Cthulhu   | 5             | 7             |

        Given I am logged in

    Scenario:
        Given I am on the "Call of Cthulhu" story page
        And I fill in "slice_body" with "The ship was nearing the island. The men were scared, but wouldn't show it."
        And I push "Create Slice"
        Then I should see "Call of Cthulhu"
        And I should see "The ship was nearing the island. The men were scared, but wouldn't show it."
