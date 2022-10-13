# mairie_christmas.rb #
require 'nokogiri'
require 'open-uri'


def get_townhall_email(x)
  page = Nokogiri::HTML(URI.open(x))
  townhall_email = page.xpath('/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]').text
  return townhall_email 
end 

puts get_townhall_email("https://annuaire-des-mairies.com/95/ableiges.html").inspect


def get_townhall_urls(url)
  page = Nokogiri::HTML(URI.open(url))
  townhall_urls = page.xpath('//p/a').map{|link| link["href"]}.map{|link| "www.http://annuaire-des-mairies.com#{link[1..-1]}" }
  return townhall_urls
end 

puts get_townhall_urls("https://annuaire-des-mairies.com/val-d-oise.html").inspect



def get_every_townhall_email(url)

    townhall_urls = get_townhall_urls(url)
    every_townhall_email = townhall_urls.map{|x| get_townhall_email(x)}
    return every_townwhall_email

end

puts get_every_townhall_email("https://annuaire-des-mairies.com/val-d-oise.html").class

