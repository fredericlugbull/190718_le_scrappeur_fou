require 'nokogiri'
require 'open-uri'


#Le CEO de Get-email Corp a besoin de tes services. Il voudrait toutes les adresses
 #e-mail des mairies du Val d'Oise. Aucun souci pour toi. Va sur cet annuaire des mairies
  #et récupère les adresses e-mails des mairies du Val d'Oise. Comme pour l'exercice précédent, 
  #tu devras enregistrer les données dans un array de hash suivant ce format :

a = [
  { "ville_1" => "email_1" },
  { "ville_2" => "email_2" }, 
  etc
]
Décomposons le programme en 2 sous-problème simples:
Tu dois être capable d'obtenir un e-mail de mairie à partir de la page de cette dernière 
(pas en partant du listing complet des mairies). Fais d'abord une méthode get_townhall_email(townhall_url) 
qui récupère l’e-mail d'une mairie à partir de l'URL de mairies, par exemple celle de Avernes.
Une fois que tu sais le faire pour une mairie, tu vas vouloir industrialiser et répéter 
ça sur tout l'annuaire du Val d'Oise. La prochaine étape est de coder une méthode get_townhall_urls 
qui récupère les URLs de chaque ville du Val d'Oise.
Quand tu es assez sûr que chaque méthode marche séparément, tu as juste à imbriquer les deux et à toi la gloire.

 page = Nokogiri::HTML(open("https://www.annuaire-des-mairies.com/95/avernes.html"))

 def scraping(page)

 # Scraping du nom de la mairie.
 names_scrap= page.xpath('//td[contains(concat(" ",normalize-space(@class)," "), " col-symbol ")]')
 names = names_scrap.map { |name| name.text.strip }
 

# Scraping des valeurs de cryptos
 values_scrap = page.xpath('//a[contains(concat(" ",normalize-space(@class)," "), " price ")]')
 
values = values_scrap.map { |value| value.text.delete("$").to_f }

 # Regroupement des deux arrays en un hash
 h = Hash[currencies.zip(values)]

 # Segmentation du hash en plusieurs hashes au sein d'un array
 result = [h.each {|k,v| Hash[k => v] }]

 puts result.inspect
end

scraping(page)