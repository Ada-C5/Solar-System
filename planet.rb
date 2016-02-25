#Anna Wilson Solar System, Wave 1 & 2

class Planet
  attr_accessor :name, :diameter, :moon_num, :solar_rate, :sun_distance

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @diameter = planet_hash[:diameter]
    @moon_num = planet_hash[:moon_num]
    @solar_rate = planet_hash[:solar_rate]
    @sun_distance = planet_hash[:sun_distance]
  end

end

mercury = Planet.new(name: "Mercury", diameter: "3031", moon_num: "0", solar_rate: "88", sun_distance: "57,900,000")
venus = Planet.new(name: "Venus", diameter: "7521", moon_num: "0", solar_rate: "225", sun_distance: "67,200,000")
earth = Planet.new(name: "Earth", diameter: "7926", moon_num: "1", solar_rate: "365.24", sun_distance: "93,000,000")
mars = Planet.new(name: "Mars", diameter: "4217", moon_num: "2", solar_rate: "687", sun_distance: "141,600,000")
jupiter = Planet.new(name: "Jupiter", diameter: "86881", moon_num: "63", solar_rate: "4343.5", sun_distance: "483,600,000")
saturn = Planet.new(name: "Saturn", diameter: "74900", moon_num: "62", solar_rate: "10767.5", sun_distance: "886,700,000")
uranus = Planet.new(name: "Uranus", diameter: "31763", moon_num: "27", solar_rate: "30660", sun_distance: "1,784,000,000")
neptune = Planet.new(name: "Neptune", diameter: "30775", moon_num: "13", solar_rate: "60225", sun_distance: "2,794,400,000")

planets_array = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]

puts "Here is a list of planets that you can learn more about:"

planets_array.length.times do |n|
  puts "#{planets_array[n].name}"
end

puts "Which planet would you like to select?"
choice = gets.chomp.downcase.capitalize!

# Displays planet info depending on choice
planets_array.each do | planet |
  if planet.name == choice
    puts "#{planet.name} has a diameter of #{planet.diameter} miles!"
    puts "It has this number of moons: #{planet.moon_num}!"
    puts "It rotates around the sun in #{planet.solar_rate} days!"
    puts "It is #{planet.sun_distance} miles away from the sun!"
  end
end

## BEGIN WAVE 2 ###

planets_array = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]

class SolarSystem
attr_accessor :planets_array

  def initialize(planets_array)
    @planets_array = planets_array
  end

end

my_system = SolarSystem.new(planets_array)

puts "BONUS FACT: The diameter of Mercury is #{my_system.planets_array[0].diameter}! WOW!!!"
#will show mercury diameter
