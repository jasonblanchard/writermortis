# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

user = User.find_or_create_by_email(ENV['TEST_USER_EMAIL'].dup)
user.password = ENV['TEST_USER_PASSWORD'].dup
user.save

user = User.find_or_create_by_email('anon@example.com')
user.name => "Anon"
user.password => ENV['ANON_PASSWORD'].dup
user.save!

finished_story = Story.find_or_create_by_title("My First Corpse");
finished_story.user_id = user.id
finished_story.total_slices = 3
finished_story.save
