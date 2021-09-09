require 'csv'

Coworking.destroy_all
User.destroy_all 
Company.destroy_all

['coworkings', 'users', 'companies'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

bdd = CSV.read("db/db_urls.csv")
User.create(email:"marin.ceo@woovv.io", password:'Woovver4Life')


9.times do |i|
  User.create(email:"cowork#{i}@coworking.com", password:'azerty')
end

Company.create(legal_name:'Woovv')

9.times do |i|
  Company.create(legal_name:"Company-#{i}")
end

bdd.each do |row|
    row_2 = row[0].split(",")
    new_coworking = Coworking.new
  begin
    new_coworking.name = row_2[0][2..-2]
    new_coworking.description = Faker::Lorem.sentence
    new_coworking.address=row_2[3][2..-2]
    new_coworking.city=row_2[5][2..-2]
    new_coworking.zipcode=row_2[4][2..-2]
    new_coworking.country="France"
    new_coworking.coworking_manager_id = 1
    new_coworking.managing_company_id = 1
    if new_coworking.city.include? "Paris" 
      uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{new_coworking.address.gsub(/[èéêë]/,'e').gsub(/[^0-9A-Za-z]/, '+')}&city='Paris'&limit=1")
    elsif new_coworking.city.include? "Marseille"
      uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{new_coworking.address.gsub(/[èéêë]/,'e').gsub(/[^0-9A-Za-z]/, '+')}&city='Marseille'&limit=1")
    elsif new_coworking.city.include? "Lyon"
      uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{new_coworking.address.gsub(/[èéêë]/,'e').gsub(/[^0-9A-Za-z]/, '+')}&city='Lyon'&limit=1")
    else  
      uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{new_coworking.address.gsub(/[èéêë]/,'e').gsub(/[^0-9A-Za-z]/, '+')}&postcode=#{new_coworking.zipcode}")
    end 

    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess) && JSON.parse(res.body)["features"].length != 0
      @datas = JSON.parse(res.body) 
      new_coworking.latitude = @datas["features"][0]["geometry"]["coordinates"][0] * 1000000
      new_coworking.longitude = @datas["features"][0]["geometry"]["coordinates"][1] * 1000000
    end 
  rescue
  end
  new_coworking.save
  new_coworking.update(is_from_scrapping: true)

end


