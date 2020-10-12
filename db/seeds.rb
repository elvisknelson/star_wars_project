require 'httparty'

Character.destroy_all
Species.destroy_all
Homeworld.destroy_all

i = 0
loop do
  i += 1
  species = HTTParty.get("https://swapi.dev/api/species/#{i}/")

  var = Species.create(name: species['name'], classification: species['classification'], designation: species['designation'])
  if i == 37
    break
  end
end

Species.create(name: 'Undefined', classification: 'Undefined', designation: 'Undefined')

i = 0
loop do
  i += 1
  world = HTTParty.get("https://swapi.dev/api/planets/#{i}/")

  var = Homeworld.create(name: world['name'], rotation_period: world['rotation_period'], climate: world['climate'])
  if i == 60
    break
  end
end

Homeworld.create(name: 'Undefined', rotation_period: -1, climate: 'Undefined')

i = 0
loop do
  i += 1
  character = HTTParty.get("https://swapi.dev/api/people/#{i}/")

  if character['species'] != nil && character['species'].length > 0
    species_uri = "https#{character['species'].to_s[6..-3]}"
    species_name = HTTParty.get(species_uri)['name']
  else
    species_name = "Undefined"
  end
  species_id = Species.where(name: "#{species_name}").first

  if character['homeworld'] != nil && character['homeworld'].length > 0
    homeworld_uri = "https#{character['homeworld'].to_s[4..-1]}"
    homeworld_name = HTTParty.get(homeworld_uri)['name']
  else
    homeworld_name = "Undefined"
  end
  homeworld_id = Homeworld.where(name: "#{homeworld_name}").first

  char = Character.create(name: character['name'], gender: character['gender'], birth_year: character['birth_year'], species_id: species_id.id, homeworld_id: homeworld_id.id,
                          mass: character['mass'], hair_color: character['hair_color'], skin_color: character['skin_color'], eye_color: character['eye_color'], height: character['height'])

  if i == 82
    break
  end
end

puts "Planets: #{Homeworld.count} Species: #{Species.count} Characters: #{Character.count}"