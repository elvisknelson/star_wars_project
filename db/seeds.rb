require 'httparty'

Species.destroy_all
Character.destroy_all
Homeworld.destroy_all
Starship.destroy_all

i = 0
loop do
  i += 1
  species = HTTParty.get("https://swapi.dev/api/species/#{i}/")

  var = Species.create(name: species['name'], classification: species['classification'], designation: species['designation'],
                       average_height: species['average_height'], language: species['language'], average_lifespan: species['average_lifespan'], people: species['people'])
  if i == 38
    break
  end
end

Species.create(name: 'Undefined', classification: 'Undefined', designation: 'Undefined',
               average_height: -1, language: 'Undefined', average_lifespan: -1, people: 'Undefined')

i = 0
loop do
  i += 1
  world = HTTParty.get("https://swapi.dev/api/planets/#{i}/")

  var = Homeworld.create(name: world['name'], rotation_period: world['rotation_period'], climate: world['climate'], diameter: world['diameter'], gravity: world['gravity'],
                         terrain: world['terrain'], surface_water: world['surface_water'], population: world['population'])
  if i == 61
    break
  end
end

Homeworld.create(name: 'Undefined', rotation_period: -1, climate: 'Undefined', diameter: -1, gravity: 'Undefined',
                 terrain: 'Undefined', surface_water: 0, population: -1)

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

  if i == 83
    break
  end
end

i = 0
loop do
  i += 1

  char = Character.create(name: Faker::Name.unique.name, gender: Faker::Demographic.sex, birth_year: "#{rand(5..325)}bby", species_id: rand(Species.first.id..Species.last.id), homeworld_id: rand(Homeworld.first.id..Homeworld.last.id),
                       mass: rand(50..150), hair_color: Faker::Color.color_name, skin_color: Faker::Color.color_name, eye_color: Faker::Color.color_name, height: rand(80..277))

  if i == 50
    break
  end
end

i = 0
loop do
  i += 1

  starship = HTTParty.get("https://swapi.dev/api/starships/#{i}/")

  if starship['name'] != nil
    Starship.create(name: starship['name'], cargo_capacity: starship['cargo_capacity'], consumables: starship['consumables'], crew: starship['crew'], hyperdrive_rating: starship['hyperdrive_rating'],
                    manufacturer: starship['manufacturer'], model: starship['model'])
  end

  if i == 50
    break
  end
end

puts "Planets: #{Homeworld.count} Species: #{Species.count} Characters: #{Character.count} Starships: #{Starship.count}"