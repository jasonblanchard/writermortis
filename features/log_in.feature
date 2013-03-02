Feature: Log in to the site
    As a storyteller
    So that I can contribute to some stories
    I want to sign in

    Background: Users in the database
        Given the following users exist:
            | email             | password  |
            | test@example.com  | testpass  |

    Scenario:
        When I am on the homepage
        And I click "Login"
        Then I should see "Sign in"
        And I fill in "user_email" with "test@example.com"
        And I fill in "user_password" with "testpass"
        And I push "Sign in"
        Then I should see "Signed in successfully."

    Scenario:
        When I am logged in
        And I am on the homepage
        And I click "Logout"
        Then I should see "Signed out successfully"
