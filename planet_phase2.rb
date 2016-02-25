class Solar_system
  attr_accessor :planets  #getters n setters
  def initialize(planets)
    @planets = planets
  end

  def add_planet name
    puts "what's the name of the planet?"
    new_name = gets.chomp
    puts "How many moons does your planet have?"
    new_moons = gets.chomp
    puts "How many rings?"
    new_rings = gets.chomp
    puts "What's the mass?"
    new_mass = gets.chomp
    puts "What's the diameter?"
    new_diameter = gets.chomp
    puts "What's the solar rotation rate?"
    new_solar_rotation_rate = gets.chomp
    puts "What's the distance from sun?"
    new_distance_from_sun = gets.chomp

    new_planet = Planet.new(name: "#{new_name}", moons: "#{new_moons}", rings: "#{new_rings}", mass: "#{new_mass}", diameter: "#{new_diameter}", solar_rotation_rate:  "#{new_solar_rotation_rate}", distance_from_sun: "#{new_distance_from_sun}")
    planets << new_planet.flatten #flatten separates data into topics in array
  end

  def planet_info planets#method for info on planets
    puts "Here are stats on #{planets.name}: it has #{planets.rings} rings and #{planets.moons} moons. It's mass is #{planets.mass} and diameter is #{planets.diameter}." +
    "It is #{planets.distance_from_sun} from the sun, and has a solar rotation rate of #{planets.solar_rotation_rate}."
  end
end

class Planet
  attr_accessor :name, :moons, :rings, :mass, :diameter, :solar_rotation_rate, :distance_from_sun #getters n setters

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @moons = planet_hash[:moons] #could I put in || "0" as default and not worry about entering so much data?
    @rings = planet_hash[:rings] || "0"
    @mass = planet_hash[:mass]
    @diameter = planet_hash[:diameter]
    @solar_rotation_rate = planet_hash[:solar_rotation_rate]
    @distance_from_sun = planet_hash[:distance_from_sun]

    if planet_hash[:moons] == nil
      @moons = "0"
    end

    if planet_hash[:rings] == nil
      @rings = []
    end
  end
end


#pass all known data on each planet
mercury = Planet.new(name: "Mercury", moons: "0", rings: "0", mass: "3.3 x 10^23kg", diameter: "3031 miles",
          solar_rotation_rate: "89 earth days", distance_from_sun: "36 million miles")
jupiter = Planet.new(name: "Jupiter", moons: "67", rings: "0", mass: "1.9 x 10^27kg", diameter: "88729 miles",
          solar_rotation_rate: "12 earth years", distance_from_sun: "483.6 million miles")
earth =  Planet.new(name: "Earth", moons: "1", rings: "0", mass: "6*10^24kg", diameter: "7926 miles",
          solar_rotation_rate: "365 earth days", distance_from_sun: "93 million miles")
mars =   Planet.new(name: "Mars", moons: "2", rings: "0", mass: "6.42*10^23kg", diameter: "4222 miles",
          solar_rotation_rate:"687 earth miles", distance_from_sun: "141.6 million miles")
venus =  Planet.new(name: "Venus", moons: "0", rings: "0", mass: "4.87*(10^24)kg", diameter: "7521 miles",
          solar_rotation_rate: "225 earth days", distance_from_sun: "67.2 million miles")


planets = [mercury, jupiter, earth, mars, venus]
my_system = Solar_system.new(planets)

# ask user for input
puts "What planet would you like to learn about? Please enter the number of your selection or type quit to leave:
1. Mercury
2. Earth
3. Mars
4. Jupiter
5. Venus"

user_planet = gets.chomp.downcase

#output after selection by user with corresponding planet info
#give correlating planet key/value from hashcase
while user_planet != "quit"
  if user_planet == "1. Mercury" || user_planet == "Mercury" || user_planet == "1"
    puts my_system.planet_info mercury
  elsif
    user_planet == "2. Earth" || user_planet == "Earth" || user_planet == "2"
    puts my_system.planet_info earth
  elsif
    user_planet == "3. Mars" || user_planet == "Mars" || user_planet == "3"
    puts my_system.planet_info mars
  elsif
    user_planet == "4. Jupiter" || user_planet == "Jupiter" || user_planet == "4"
    puts my_system.planet_info jupiter
  elsif
    user_planet == "5. Venus" || user_planet == "Venus" || user_planet == "5"
    puts my_system.planet_info venus
  else puts "We didn't get your response - Try again!"
  end

  puts "Do you want to learn about another planet? Select again or quit:
    1. Mercury
    2. Earth
    3. Mars
    4. Jupiter
    5. Venus"
    user_planet = gets.chomp.downcase

if user_planet == "quit"
    puts "Thanks for visiting!"
  end
end
