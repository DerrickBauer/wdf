# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
u1 = User.new(email: 'robynbauer@gmail.com', encrypted_password:'$2a$10$wsd3voZADmJ5QtEhDSryyOhdkSHXtCGOc4hwlCB5HTMoSjgvOi/Nq').save(validate:false)