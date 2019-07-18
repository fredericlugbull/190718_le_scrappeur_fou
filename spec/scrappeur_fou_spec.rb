require_relative '../lib/scrappeur_fou
require 'nokogiri'
require 'open-uri'

Ouvrir l'URL souhaitée sous Nokogiri et le stocker dans un objet page avec page = Nokogiri::HTML(open("ton_url_a_scrapper.com"))
Extraire les éléments HTML que tu veux scrapper en utilisant leur XPath et en les stockant dans un array (par exemple all_emails_links) avec all_emails_links = page.xpath('/mettre_ici_le_XPath'). Dans ce cas all_emails_links est un array d'éléments HTML.