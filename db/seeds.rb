require 'csv'

Coworking.destroy_all
User.destroy_all 
Company.destroy_all

['coworkings', 'users', 'companies'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

bdd = CSV.read("db/db_urls.csv")

10.times do |i|
  User.create(email:"cowork#{i}@coworking.com", password:'azerty')
end

10.times do |i|
  Company.create(legal_name:"Company-#{i}")
end

bdd.each do |row|
  row_2 = row[0].split(",")
  # puts row_2[0][2..-2]
  new_coworking = Coworking.new
begin
  new_coworking.name = row_2[0][2..-2]
  new_coworking.description = Faker::Lorem.sentence
  new_coworking.address=row_2[3][2..-2]
  new_coworking.city=row_2[5][1..-2]
  new_coworking.zipcode=row_2[4][1..-2]
  new_coworking.country="France"
  new_coworking.manager_id = rand(1..10)
  new_coworking.managing_company_id = rand(1..10)
  # (new_coworking.is_from_scrapping?) 
rescue
end
  new_coworking.save

end


