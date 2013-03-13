Given /^the following users exist:$/ do |table|
    table.hashes.each do |user|
        @user = User.create :email => user[:email], :password => user[:password], :name => user[:name]
    end
end

When /^I am on the homepage$/ do
    visit '/'
end

When /^I click "(.*?)"$/ do |arg1|
    click_link arg1
end

Then /^I should see "(.*?)"$/ do |arg1|
    page.should have_content arg1
end

Then /^I fill in "(.*?)" with "(.*?)"$/ do |form, value|
    fill_in form, :with => value
end

When /^I push "(.*?)"$/ do |arg1|
    click_button arg1
end

When /^I am logged in$/ do
    visit '/accounts/login'
    fill_in "user_email", :with => "test@example.com"
    fill_in "user_password", :with => "testpass"
    click_button "Sign in"
end

Given /^the following stories exist:$/ do |table|
    table.hashes.each do |story|
        author_id = User.find_by_name(story['author']).id
        story = Story.create( :title => story["Title"], :max_sentences => story["Max Sentences"], :total_slices => story["Total Slices"], :user_id => author_id)
    end
end

Given /^I am on the "(.*?)" story page$/ do |title|
    story = Story.find_by_title(title)
    id = story.id
    visit "/stories/#{id}"
end

Given /^I am logged out$/ do
    page.driver.submit :delete, "/accounts/logout", {}
end

Given /^"(.*?)" is logged in$/ do |email|
    visit '/accounts/login'
    fill_in 'user_email', :with => email
    fill_in 'user_password', :with => 'testpass'
    click_button "Sign in"
end

Then /^I should not see "(.*?)"$/ do |arg1|
    page.should have_no_content(arg1)
end

Then /^I should not see the "(.*?)" form$/ do |form|
    have_no_css?("form.#{form}")
end

Then /^the HTML should show that "(.*?)" wrote "(.*?)"$/ do |name, slice|
    id = User.find_by_name(name).id
    page.body.include?("<span id=\"user_#{id}\">#{slice}</span>").should be_true
end
