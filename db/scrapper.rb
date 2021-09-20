# frozen_string_literal: true

require 'rubygems'
require 'nokogiri'
require 'open-uri'
require 'csv'

# A partir de l'URL d'un CW, on récupère sous forme de tableau les infos qui nous intéressent

def get_cw_infos_from_url(url_coworking)
  begin
    page = Nokogiri::HTML(URI.open(url_coworking))
    cw_info_tab = []
    name = page.css('h1.product_title').text
    city = page.css('h2')[0].text.split(' ')

    index_a_in = (city.include?('à') ? city.index('à') : city.index('in')) + 1
    index_ses_premises = (city.include?('ses') ? city.index('ses') : city.index('premises'))

    city = city[index_a_in..].join(' ')
    full_address = page.css('.rh-360-content-area p')[2].text

    full_address = full_address.split(' ')[3..].join(' ')

    address2 = (full_address.slice! name)

    full_address = full_address.split('.')[0].split(' ')[1..].join(' ')

    address_tab = full_address.split(',')

    street_address = address_tab[0]
    zip_code = address_tab[1][1..]

    full_address = full_address.split(",").join(' -')

    cw_info_tab << name # name
    cw_info_tab << url_coworking # URL
    cw_info_tab << full_address # full address
    cw_info_tab << street_address # street address
    cw_info_tab << zip_code
    cw_info_tab << city

    cw_info_tab << page.css('.rh-360-content-area p')[11].text # pricing
    cw_info_tab << page.css('.rh-360-content-area p')[9].text # opening hours
    cw_info_tab << page.css('.rh-360-content-area p a')[0]['href'] # penser à retirer le lien affilié coworking-france par la suite
  rescue StandardError
    puts "error 🥲"
    CSV.open("db/errors_scrapper.csv", "a+") do |csv|
      csv << [url_coworking]
    end
  end
  cw_info_tab
end

# get_cw_infos_from_url('https://www.coworking-france.com/espace-coworking/mama-works-bordeaux/')

# Fonction qui récupère la liste d'URL d'une page d'index donnée

def get_coworking_url(page_liste_24_results)
  page = Nokogiri::HTML(URI.open(page_liste_24_results))
  link_coworking = page.css('h3 a')
  url_tab = []
  link_coworking.each do |lien|
    # url_tab << lien['href']
    url_tab << lien['href']
  end
  url_tab
end

# Fonction qui parcourt chaque page de l'index (105 pages et applique la fonction
# get_coworking_url sur chacune d'entre elle et stocke toutes les URLs dans un tableau

def get_all_cw_infos(page_index_general)
  tab_all_url = []
  CSV.open("db/db_urls.csv", "w+") do |csv|
    (0..105).each do |i|
      page = page_index_general + i.to_s
      get_coworking_url(page).each do |url|
        csv << [get_cw_infos_from_url(url)]
      end
    end
  end
end

get_all_cw_infos('https://www.coworking-france.com/coworking/coworking-france/page/')
