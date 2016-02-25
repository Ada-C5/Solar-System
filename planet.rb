# Welcome to the 'Verse

class Verse

  attr_accessor :planets

# initialize the 'verse with empty hash to add planets to
  def initialize(verse)
    @the_verse = verse
    @planets = {}
  end

# method to add new planets to the hash, adding name as key
  def new_planet(planet)
    @planets[planet.name] = planet
  end

# method to print out planet names as ordered list
def list_planets
  counter = 1
  @planets.each_key do |planet|
    puts counter.to_s + ". " + planet
    counter += 1
  end
end
end

class Planet
  attr_accessor :name, :orbits, :moons, :region, :diameter, :terraformed

# creates hash of planets with variables as keys
  def initialize(planets_hash)
    @name = planets_hash[:name]
    @orbits = planets_hash[:orbits]
    @moons = planets_hash[:number_of_moons]
    @region = planets_hash[:region] # central, border, rim
    @diameter = planets_hash[:diameter_km] # diameter in kilometers
    @terraformed = planets_hash[:terraformed]
  end

end

# Create our 'Verse

#creates instance variables of planets with key/value pairs within Planet class

@ariel = Planet.new(name: "Ariel", orbits: "White Sun", number_of_moons: 3,
region: "Central Planets", diameter_km: "13,016", terraformed: 2266)

@londinium = Planet.new(name: "Londinium", orbits: "White Sun", number_of_moons: 2,
region: "Central Planets", diameter_km: "18,000", terraformed: 2220)

@osiris = Planet.new(name: "Osiris", orbits: "White Sun", number_of_moons: 2,
region: "Central Planets", diameter_km: "13,523", terraformed: 2256)

@beaumonde = Planet.new(name: "Beaumonde", orbits: "Kalidasa", number_of_moons: 2,
region: "Rim Space", diameter_km: "12,000", terraformed: 2433)

@persephone = Planet.new(name: "Persephone", orbits: "Lux", number_of_moons: 2,
region: "Central Planets", diameter_km: "14,613", terraformed: 2308)

@ezra = Planet.new(name: "Ezra", orbits: "Georgia", number_of_moons: 1,
region: "Border Space", diameter_km: "9,290", terraformed: 2350)

@meridian = Planet.new(name: "Meridian", orbits: "Blue Sun", number_of_moons: 1,
region: "Rim Space", diameter_km: "9,480", terraformed: 2430)

# create the verse and give it a name
@the_verse = Verse.new("'Verse")

# use new_planet method to push each planet into the verse hash (part of Verse class)
@planets = @the_verse.new_planet(@ariel)
@planets = @the_verse.new_planet(@londinium)
@planets = @the_verse.new_planet(@osiris)
@planets = @the_verse.new_planet(@beaumonde)
@planets = @the_verse.new_planet(@persephone)
@planets = @the_verse.new_planet(@ezra)
@planets = @the_verse.new_planet(@meridian)


puts "Welcome to the 'Verse! Check out some great destinations: "

again = "Y"
while again == "Y"
# runs the each_key loop to print out a numbered list of planets
@the_verse.list_planets

puts "Please learn more about a planet before traveling."
puts "Choose a planet to learn more about (1-7):"
planet_choice = gets.chomp.to_i

# user needs to enter a valid number
until (1..7).include? planet_choice
  puts "Sorry, I need a number from 1-7:"
  planet_choice = gets.chomp.to_i
end

#assigns variable 'choice' to all information in each planet instance variable
case planet_choice
when 1 then choice = @ariel
  puts "Don't forget to check out Ariel City. Great for tourists."
when 2 then choice = @londinium
  puts "Alliance territory. Wouldn't go there with a ship full of contraband"
when 3 then choice = @osiris
  puts "Steer clear of the blackout zones. Whether you're doing something illegal or not."
when 4 then choice = @beaumonde
when 5 then choice = @persephone
when 6 then choice = @ezra
when 7 then choice = @meridian
end

# assigns instance variable to each method called on user choice
@name = choice.name
@orbits = choice.orbits
@moons = choice.moons
@region = choice.region
@diameter = choice.diameter
@terraformed = choice.terraformed

# print out info on chosen planet
puts "Name: #{@name}"
puts "Orbits around: #{@orbits}"
puts "Number of moons: #{@moons.to_s}"
puts "Region: #{@region}"
puts "Diameter: #{@diameter}km"
puts "Terraformed: #{@terraformed.to_s}"
puts "...you can't take the sky from me"

puts "Would you like to learn about another planet? (Y/N)"
again = gets.chomp.upcase

unless again == "Y" || again == "N"
  "Enter Y or N"
  again = gets.chomp.upcase
end
end
