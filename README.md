About
=====

Writer Mortis is an experiment in Ruby on Rails and storytelling.

It's a web app for writing collaborative stories like an exquisite corpse -- users contribute to a story by only seeing the chunk contributed by the previous user.

Installation
============
Install RVM to manage ruby versions and your Gemset for this project.

Run `git clone https://github.com/jasonblanchard/writermortis.git`

`cp config/application.yml.example config/application.yml` and fill out variables

Run `rake db:migrate` to set up the schema (or `rake db:schema:load` if its a fresh database)

Run `rake db:seed` to initialize examples and default values (This part is IMPORTANT!)
