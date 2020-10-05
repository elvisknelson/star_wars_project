# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'httparty'

url = 'https://swapi.dev/api/people/'


i = 1
loop do
  response = HTTParty.get("https://swapi.dev/api/people/#{i}/")
  puts response.parsed_response['name']

  i += 1
  if i == 4
    break
  end
end