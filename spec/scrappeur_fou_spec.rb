require_relative '../lib/scrappeur_fou'
require 'nokogiri'
require 'open-uri'

#Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page avec page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))
#Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array (par exemple all_emails_links)
# avec all_emails_links = page.xpath('/mettre_ici_le_XPath'). Dans ce cas all_emails_links est un array d'éléments HTML.
#En prenant pour source le site CoinMarketCap, fait un programme qui récupère le cours de toutes les cryptomonnaies et 
#les enregistre bien proprement dans un array de hashs. #Ton array devra avoir le format suivant :
#a = [
#  { "BTC" => 5245.12 },
#  { "ETH" => 217.34 }, 
#  etc
#]


#Rappel: un hash s’initialise avec result = Hash.new et on y stocke des infos avec result['ta_key'] = 'ta_value'

page = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))   # Ouvre l'URL souhaitée sous Nokogiri et le stocke dans un objet page 

result = Hash.new
result[crypo_name] = 'crypto_value'

crypto_name_array = page.xpath('//h1')

crypto_name_array.each do |key, value|
    puts "#{key} et #{value}"
  end
       

#Si tu veux récupérer tous les liens d'une page, tape page.xpath('//a'). Pour tous les titres h1, utilise page.xpath('//h1')
#Si tu veux récupérer les liens situés sous un titre h1 (même s'ils sont inclus dans un paragraphe, lui-même imbriqué dans une div), tape page.xpath('//h1//a').
#Si tu veux récupérer les liens situés DIRECTEMENT sous un titre h1 (sans élément intermédiaire), tape page.xpath('//h1/a').
#Si tu veux récupérer TOUS les éléments HTML situés DIRECTEMENT sous un titre h1, tape page.xpath('//h1/*').
#Si tu veux récupérer le lien ayant l'id email situé sous un titre h1 de classe primary, tape page.xpath('//h1[@class="primary"]/a[@id="email"]').
