# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ :name => 'Chicago' }, { :name => 'Copenhagen' }])
#   Mayor.create(:name => 'Daley', :city => cities.first)

Role.create!(name: 'citizen')
Role.create!(name: 'alderman')
Role.create!(name: 'assembly_president')

@act = Act.create(:preambula => "test", :name => "blabla")

Head.create(:act => @act, :name => "test_head")
