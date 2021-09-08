require 'csv'

Coworking.destroy_all
User.destroy_all 
Company.destroy_all

# ['coworkings', 'users', 'companies'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

bdd = CSV.read("db/db_urls.csv")

# 50.times do |i|
#   User.create(email:"cowork#{i}@coworking.com", password:'azerty')
# end

# 10.times do |i|
#   Company.create(legal_name:"Company-#{i}")
# end

# bdd.each do |row|
#   row_2 = row[0].split(',')

#   Coworking.create({
#     name: (row_2[0])[2..-2],
#     description: Faker::Lorem.sentence,
#     # address:(row_2[3])[1..-2],
#     # city:(row_2[5])[1..-2],
#     # zipcode:(row_2[4])[1..-2],
#     country:"France",
#     manager_id:rand(1..10),
#     is_from_scrapping?: true
#   })
# end


