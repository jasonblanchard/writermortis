Feature: Add slice to a story
    As a contributor
    So that I can have fun with a story
    I want to add a slice to a story

    Background:
        Given the following stories exist:
            | Title             | Max Sentences | Total Slices  |
            | Call of Cthulhu   | 5             | 3             |

        Given the following users exist:
            | email             | password  | name      |
            | test@example.com  | testpass  | test      |
            | sally@example.com | testpass  | Sally     |


    Scenario:
        Given I am logged in
        Given I am on the "Call of Cthulhu" story page
        And I fill in "slice_body" with "The ship was nearing the island. The men were scared, but wouldn't show it."
        And I push "Add to the Story"
        Then I should see "Call of Cthulhu"
        And I should see "The ship was nearing the island. The men were scared, but wouldn't show it."
        And I should see "2 more until the story is done."

    Scenario:
        Given I am logged out
        Given "sally@example.com" is logged in
        Given I am on the "Call of Cthulhu" story page
        And I fill in "slice_body" with "The men were going to an island of unicorns."
        And I push "Add to the Story"
        And I am logged out
        And "test@example.com" is logged in
        And I am on the "Call of Cthulhu" story page
        And I fill in "slice_body" with "And they were very excited."
        And I push "Add to the Story"
        And I am logged out
        And "sally@example.com" is logged in
        And I am on the "Call of Cthulhu" story page
        And I fill in "slice_body" with "They loved unicorns."
        And I push "Add to the Story"
        Then I should see "The story is done:"
        And I should see "The men were going to an island of unicorns. And they were very excited. They loved unicorns."
        And I should not see "Add to the Story"
