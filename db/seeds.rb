# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by_email(ENV['TEST_USER_EMAIL'].dup)
user.password = ENV['TEST_USER_PASSWORD'].dup
user.name = ENV['TEST_USER_NAME'].dup
user.save!

anon = User.find_or_create_by_email('anon@example.com')
anon.name = "Anon"
anon.password = ENV['ANON_PASSWORD'].dup
anon.save!

finished_story = Story.find_or_create_by_title("My First Corpse");
finished_story.user_id = user.id
finished_story.total_slices = 3
finished_story.save

bodies = [
    { :user_id => anon.id, :body => "This is the beginning of the story." },
    { :user_id => user.id, :body => "This is a new part of the story." },
    { :user_id => anon.id, :body => "And this is the end of the story."}
]

unless finished_story.done?
    bodies.each do |slice|
        index = bodies.index(slice)
        finished_story.slices.create!(bodies[index])
    end
end
