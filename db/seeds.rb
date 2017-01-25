# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'rubygems'
require 'open-uri'
require 'nokogiri'

url = 'http://www.languagedaily.com/learn-german/vocabulary/common-german-words'
html = open(url)

doc = Nokogiri::HTML(html)

page = Nokogiri::HTML(open("http://www.languagedaily.com/learn-german/vocabulary/common-german-words"))

germans = doc.css('td.bigLetter')
germans.each do |german|
  puts "German is: #{german.text}"
  puts "English is: #{german.next_element.text}"
  Card.create(original_text: german.text, translated_text: german.next_element.text)
end
