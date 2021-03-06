Feature: Log in to the site
    As a storyteller
    So that I can contribute to some stories
    I want to sign in

    Background: Users in the database
        Given the following users exist:
            | email             | password  | name  |
            | test@example.com  | testpass  | test  |
            | sally@example.com | testpass  | sally |

        Given the following stories exist:
            | Title             | Max Sentences | Total Slices  | author    |
            | Into the wild     | 5             | 3             | test      |
            | A Completed Story | 5             | 2             | test      |


    Scenario: User can log in
        When I am on the homepage
        And I click "Login"
        Then I should see "Sign in"
        And I fill in "user_email" with "test@example.com"
        And I fill in "user_password" with "testpass"
        And I push "Sign in"
        Then I should see "Signed in successfully."

    Scenario: User can log in
        When I am logged in
        And I am on the homepage
        And I click "Logout"
        Then I should see "Signed out successfully"

    Scenario: Anon user cannot add a story
        Given I am logged out
        And I am on the homepage
        Then I should not see "New Story"

    Scenario: Anon user cannot add a slice to a story
        Given I am logged out
        Given I am on the "Into the wild" story page
        Then I should not see the "new_slice" form
        And I should see "Sign in to add to the story"

    Scenario: Logged in user sees their stories
        Given I am logged in
        Then the page should list "Into the wild" as "Unfinished"
        And the page should list "A Completed Story" as "Finished"

    Scenario: Logged in user without any stories sees special message on sidebar
        Given "sally@example.com" is logged in
        And I am on the homepage
        Then I should see "You don't have any stories yet :/ You can start a new one or contribute to an existing story."
