# dark_trader.rb #
require 'nokogiri' 
require 'open-uri'
page = Nokogiri::HTML(URI.open("https://coinmarketcap.com/all/views/all/"))

puts page.class

def give_crypto_name(source)
crypto_name = []

source.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[2]/div/a[2]').each{|n| crypto_name.push(n.text)}
return crypto_name 
end 
  
puts give_crypto_name(page).inspect

def give_crypto_value(source)
crypto_value = []

source.xpath('/html/body/div[1]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr/td[5]/div/a/span').each{|n| crypto_value.push(n.text)}
return crypto_value
end 

puts give_crypto_value(page).inspect

crypto_library= give_crypto_name(page).zip(give_crypto_value(page)).map! { |k, v| { k => v}}
puts crypto_library.inspect 
