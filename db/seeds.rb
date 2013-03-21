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

finished_story = Story.find_or_create_by_title("My First Corpse");
story.user_id = user.id
story.total_slices = 3
story.save
