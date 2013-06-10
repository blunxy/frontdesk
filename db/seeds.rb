# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Attendee.create(:first_name => "Jordan",
                :last_name => "Pratt",
                :email => "blunxy@gmail.com")
Attendee.create(:first_name => "John",
                :last_name => "Mortimer",
                :email => "foo@example.com")
Attendee.create(:first_name => "Squirtle",
                :last_name => "Peeka",
                :email => "sp@jooble.com")
