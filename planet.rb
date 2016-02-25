#Eventually I'll put comments here
#
#
#
#
#
#
#
#
#

class SolarSystem
  attr_accessor :name, :planets, :star, :formation_date_billion
    def initialize(system_hash)
      @name = system_hash[:name]
      @planets = system_hash[:planets]
      @star = system_hash[:star]
      @formation_date_billion = system_hash[:formation_date]

      if system_hash[:planets] == nil
        @planets = []
      end
    end

    def add_planets(any_planet)
      @planets << any_planet
    end
end

solar = SolarSystem.new(name: "Earth's Satellite") #Aristotle's fault (4th century BCE)
solar.name = "Center of the Universe" #Kepler's Third Law 1619
solar.name = "Solar System" #Named for our Star System's sun!
solar.formation_date_billion = 4600000000

alpha = SolarSystem.new(name: "Alpha Centauri", star: "Alpha Centauri A, Alpha Centauri B, and Alpha Centauri C")

class Planet
  attr_reader :name, :type, :moon_count, :moon_names, :water_state, :solar_day, :solar_orbit, :distance_from_sun

  def initialize(planet_info)
    @name = planet_info[:name]
    @type = planet_info[:type]
    @moon_count = planet_info[:moon_count]
    @moon_names = planet_info[:moon_names]
    @water_state = planet_info[:water_state]
    @solar_day = planet_info[:solar_day]
    @solar_orbit = planet_info[:solar_orbit]
    @distance_from_sun = planet_info[:distance_from_sun]
  end
end

mercury = Planet.new(name: "Mercury", type: "terrestrial", moon_count: 0, water_state: "as trace amounts of vapor", solar_day: "4223.28 earth hours", solar_orbit: "175.97 earth days", distance_from_sun: 35.98)
venus = Planet.new(name: "Venus", type: "terrestrial", moon_count: 0, water_state: "in a gas state", solar_day: "2802 earth hours", solar_orbit: "225 earth days", distance_from_sun: 67.24)
earth = Planet.new(name: "Earth", type: "terrestrial", moon_count: 1, moon_names: "The Moon (or Luna)", water_state: "primarily in a liquid state", solar_day: "24 earth hours", solar_orbit: "365.24 earth days", distance_from_sun: 92.96)
mars = Planet.new(name: "Mars", type: "terrestrial", moon_count: 2, moon_names: "Deimos and Phobos", water_state: "in a liquid and ice state", solar_day: "24.659 earth hours", solar_orbit: "687 earth days", distance_from_sun: 141.6)
jupiter = Planet.new(name: "Jupiter", type: "jovian", moon_count: 67, moon_names: "lo, Europa, Ganymede, and Callisto", water_state: "as trace amounts of vapor", solar_day: "9.933 earth hours", solar_orbit: "4,380 earth days", distance_from_sun: 483.8)
saturn = Planet.new(name: "Saturn", type: "jovian", moon_count: 62, moon_names: "Titan and Mimas. Titan has a nitrogen-rich atmosphere similar to Earth, and Mimas looks an awful lot like the Death Star", water_state: "in an ice state", solar_day: "10.65 earth hours", solar_orbit: "10,832 earth days", distance_from_sun: 890.7)
uranus = Planet.new(name: "Uranus", type: "jovian", moon_count: 27, moon_names: "Uranus' five major moons: Miranda, Ariel, Umbriel, Titania, and Oberon. All twenty seven of Uranus's moons are named after characters from the works of William Shakespeare", water_state: "in an ice state", solar_day: "17.233 earth hours", solar_orbit: "30,660 earth days", distance_from_sun: 1787)
neptune = Planet.new(name: "Neptune", type: "jovian", moon_count: 14, moon_names: "Neptune's regular moons: Naiad, Thalassa, Despina, Galatea, Larissa", water_state: "in an ice state", solar_day: "16.1 earth hours", solar_orbit: "60,225 earth days", distance_from_sun: 2795)

solar.add_planets(mercury)
solar.add_planets(venus)
solar.add_planets(earth)
solar.add_planets(mars)
solar.add_planets(jupiter)
solar.add_planets(saturn)
solar.add_planets(uranus)
solar.add_planets(neptune)

learning_start = <<YES

Welcome, knowledge-seeker! I am here to guide you on a learning journey about
our Solar System, one of the billions of Star Systems in our local Galaxy: The
Milky Way.

Before we get started, I highly recommend you start playing "A Glorious Dawn" by
Mr. John D. Boswell, feat. Carl Sagan and Stephen Hawking. It'll be way cool.

Have you started it yet (Y/N)?
YES

puts learning_start
musical_enhancement = gets.chomp.downcase

until musical_enhancement == "y" || musical_enhancement == "n"
  puts "\nI need to know if you are ready! Have you started the song yet (Y/N)?"
  musical_enhancement = gets.chomp.downcase
end

if musical_enhancement == "y"
  puts "\nYAS! Thank you for enhancing our learning environment!"
else
  puts "\nOh, ok. Not into rad music? That's alright...I guess."
end

puts "\nPlease enter the number next to the planet you want to know about " +
  "(if you're done learning, enter 9)"
puts "\n1. #{solar.planets[0].name}"
puts "2. #{solar.planets[1].name}"
puts "3. #{solar.planets[2].name}"
puts "4. #{solar.planets[3].name}"
puts "5. #{solar.planets[4].name}"
puts "6. #{solar.planets[5].name}"
puts "7. #{solar.planets[6].name}"
puts "8. #{solar.planets[7].name}"
puts "9. EXIT"

selection = gets.chomp.to_i

until selection == 9
    x = selection - 1

puts "\nYou have requested to learn about #{solar.planets[x].name}. " +
  "#{solar.planets[x].name} is a #{solar.planets[x].type} type planet."

  if solar.planets[x].moon_count == 0
    puts "\n#{solar.planets[x].name} has #{solar.planets[x].moon_count.to_s} " +
    "moons. Poor lonely, #{solar.planets[x].name}... :("
  elsif solar.planets[x].moon_count == 1
    puts "\nIt has #{solar.planets[x].moon_count.to_s} moon, which is named " +
      "#{solar.planets[x].moon_names}. OMG! #{solar.planets[x].name} + " +
      "#{solar.planets[x].moon_names} is my OTP!"
  elsif solar.planets[x].moon_count >= 2
    puts "\nIt has #{solar.planets[x].moon_count.to_s} moons, the most notable of which " +
      "are #{solar.planets[x].moon_names}."
  end

puts "\nDid you know that there is water on #{solar.planets[x].name}? It's true! " +
 "It exists #{solar.planets[x].water_state}! A day on #{solar.planets[x].name} " +
 "is equal to #{solar.planets[x].solar_day}, and a year on #{solar.planets[x].name} " +
 "is equal to #{solar.planets[x].solar_orbit}!"
#puts "\nSince our #{solar.formation_date_billion.join(",")}"

puts "\n#{solar.planets[x].name} is #{solar.planets[x].distance_from_sun} million " +
  "miles from the sun."

#solar_formation_date_readable = solar.formation_date_billion /1000000000
#system_age_earth_days = solar.formation_date_billion * 365
#local_year = system_age_earth_days / solar.planets[x].solar_orbit
#local_year_readable = local_year / 1000000000

#puts "\nSince the #{solar.name} is #{solar_formation_date_readable} years " +
#  "old, we can calculate that the local year (meaning, the number of times " +
#  "#{solar.planets[x].name} has completed its orbit) on #{solar.planets[x].name} " +
#  "is #{local_year}."

puts "\nWould you like to calculate how far #{solar.planets[x].name} is from another " +
 "planet? If so, select a planet from the list below, using numbers like we did " +
 "before."
puts "\n1. #{solar.planets[0].name}"
puts "2. #{solar.planets[1].name}"
puts "3. #{solar.planets[2].name}"
puts "4. #{solar.planets[3].name}"
puts "5. #{solar.planets[4].name}"
puts "6. #{solar.planets[5].name}"
puts "7. #{solar.planets[6].name}"
puts "8. #{solar.planets[7].name}"

distance_planet = gets.chomp.to_i
y = distance_planet - 1

  if solar.planets[x].distance_from_sun > solar.planets[y].distance_from_sun
    distance_result = solar.planets[x].distance_from_sun - solar.planets[y].distance_from_sun
  elsif
    distance_result = solar.planets[y].distance_from_sun - solar.planets[x].distance_from_sun
  elsif solar.planets[y].distance_from_sun == solar.planets[x].distance_from_sun
    puts "Well. The answer is zero. Because that is the same planet."
  end

puts "\nGreat! The distance between #{solar.planets[x].name} and #{solar.planets[y].name} is " +
  "#{distance_result} million miles. WOW!"

puts "\nWould you like to learn about another planet? If so, please make your " +
  "next selection."
puts "\n1. #{solar.planets[0].name}"
puts "2. #{solar.planets[1].name}"
puts "3. #{solar.planets[2].name}"
puts "4. #{solar.planets[3].name}"
puts "5. #{solar.planets[4].name}"
puts "6. #{solar.planets[5].name}"
puts "7. #{solar.planets[6].name}"
puts "8. #{solar.planets[7].name}"
puts "9. EXIT"

selection = gets.chomp.to_i
end

puts "\nGoodbye! SPACE IS GREAT! SPACE!!!!"
