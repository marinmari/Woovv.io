require 'csv'

Coworking.destroy_all
User.destroy_all 
Company.destroy_all
PublicSetUpAccess.destroy_all

['Absent', 'Gratuit', 'Payant'].map {|access| PublicSetUpAccess.create(set_up_access: access)}

['coworkings', 'users', 'companies', 'public_set_up_accesses'].map {|tab| ActiveRecord::Base.connection.reset_pk_sequence!(tab)}

bdd = CSV.read("db/db_urls.csv")

User.create(email:"marin.ceo@woovv.io", password:'Woovver4Life')


# 9.times do |i|
#   User.create(email:"cowork#{i}@coworking.com", password:'azerty')
# end

Company.create(legal_name:'Woovv')

9.times do |i|
  Company.create(legal_name:"Company-#{i}")
end
count = 0
bdd.each do |row|
    row_2 = row[0].split(",")
    new_coworking = Coworking.new
  begin
    new_coworking.name = row_2[0][2..-2]
    new_coworking.address=row_2[3][2..-2]
    new_coworking.description = "#{new_coworking.name} vous accueille #{new_coworking.address}. Nous vous accompagnerons avec plaisir dans la réservation d'un espace de travail."
    new_coworking.city=row_2[5][2..-2]
    if row_2[4][2..-2].length != 5
      new_coworking.zipcode="0"+row_2[4][2..-2]
    else 
      new_coworking.zipcode=row_2[4][2..-2]
    end 
    puts new_coworking.zipcode
    new_coworking.country="France"
    new_coworking.coworking_manager_id = 1
    new_coworking.managing_company_id = 1
    uri = URI("https://api-adresse.data.gouv.fr/search/?q=#{row_2[2][2..-2].gsub('- ', '').gsub(' ', '+').gsub(/[èéêë]/,'e').gsub(/[^0-9A-Za-z]/, ' ')}&limit=1")
    res = Net::HTTP.get_response(uri)
    if res.is_a?(Net::HTTPSuccess) && JSON.parse(res.body)["features"].length != 0
      @datas = JSON.parse(res.body) 
      new_coworking.latitude = @datas["features"][0]["geometry"]["coordinates"][0] * 1000000
      new_coworking.longitude = @datas["features"][0]["geometry"]["coordinates"][1] * 1000000
    end 
  rescue
    
  end
  if !new_coworking.zipcode || new_coworking.zipcode.length != 5 || new_coworking.longitude == nil || new_coworking.latitude == nil
    puts "error !!!!!!"
    count += 1
    CSV.open("db/errors_seed.csv", "w+") do |csv|
      csv << [new_coworking.name, new_coworking.address,new_coworking.city,new_coworking.zipcode, uri]
    end
  else 
    new_coworking.save
    new_coworking.update(is_from_scrapping: true)
  end 

end
puts count


