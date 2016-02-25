  #

class SolarSystem
    attr_accessor :system_name, :planets

    def initialize(hashall)
      @system_name = hashall[:name]
      @planets = []
    end

    def add_planet(planet)
      @planets.push(planet)
    end

    def add_many(planetlist)
      @planets.push(planetlist).flatten!
    end

    ## A method that finds the name of each instance in the array @planets and lists it together with the index.
    def list_planets
      allnames = Array.new
      @planets.each do |thisplanet|
        allnames.push(thisplanet.name)
      end
      menuname_array = Array.new
      for i in 0..(allnames.length-1)
        menuname_array.push("Planet #{i+1}: #{allnames[i]}")
      end
      return menuname_array
    end

    # A method that creates an array with all valid inputs
    def validation_array
      allnames = Array.new
      @planets.each do |thisplanet|
        allnames.push(thisplanet.name)
      end
      for i in 0..allnames.length-1
        allnames.push((i+1).to_s)
      end
      return allnames
    end

end

class Planet
  attr_accessor :name, :solar_rotation, :diameter, :mass, :moons, :distance_from_the_sun

  def initialize(planetinfo_hash)
    @name = planetinfo_hash[:name]
    @solar_rotation = planetinfo_hash[:solar_rotation]
    @diameter = planetinfo_hash[:diameter]
    @mass = planetinfo_hash[:mass]
    @moons = planetinfo_hash[:moons]
    @distance_from_the_sun = planetinfo_hash[:distance_from_the_sun]
  end

  def present_info
    puts "\n* Planet #{@name}:"
    puts "  - The solar rotation is of #{@solar_rotation} days."
    puts "  - The diameter is #{@diameter} and it has a mass of #{@mass}."
    puts "  - It is located #{@distance_from_the_sun} lights years from the sun and it has #{@moons} moons."
  end


end

my_solar_system = SolarSystem.new(name: "Our Solar System")

#planet_hash = {1 => "Mercury", 2 => "Venus", 3 => "Earth", 4 => "Mars", 5 => "Jupiter", 6 => "Saturn", 7 => "Uranus", 8 => "Neptune"}


mercury = Planet.new(name: "Mercury", solar_rotation: 116, diameter: 2233, mass: 38, moons: 0, distance_from_the_sun:23)
my_solar_system.add_planet(mercury)
venus = Planet.new(name: "Venus", solar_rotation: 110, diameter: 207, mass:94, moons:0, distance_from_the_sun:35)
my_solar_system.add_planet(venus)
earth = Planet.new(name: "Earth", solar_rotation: 80, diameter: 5903, mass:211, moons:1, distance_from_the_sun:44)
my_solar_system.add_planet(earth)
mars = Planet.new(name: "Mars", solar_rotation:77, diameter: 453, mass:408, moons:2, distance_from_the_sun:66)
my_solar_system.add_planet(mars)

jupiter = Planet.new(name: "Jupiter", solar_rotation:30, diameter:22423, mass:38, moons: 1, distance_from_the_sun:78)
saturn = Planet.new(name: "Saturn", solar_rotation:21, diameter: 2258, mass:718, moons:3, distance_from_the_sun:82)
uranus = Planet.new(name: "Uranus", solar_rotation:200, diameter: 733, mass:408, moons:0, distance_from_the_sun:91)
neptune = Planet.new(name: "Neptune", solar_rotation:96, diameter: 33, mass:200, moons:1, distance_from_the_sun:123)

faraway_planets = [jupiter, saturn, uranus, neptune]
my_solar_system.add_many(faraway_planets)

continue = "Y"
while continue == "Y" || continue == "y" do

  puts "Please select a planet that you would like to learn more about:"
  puts "The available list of planets in #{my_solar_system.system_name}are:"

# Call the list_planets method to create a list of all available planets
  puts "List of planets is:"
  puts my_solar_system.list_planets

  print "SELECT PLANET:"
  selected_planet = gets.chomp.downcase

  until my_solar_system.validation_array.include? selected_planet
    puts "That is not a supported planet, please select one from the list provided:"
    selected_planet = gets.chomp.downcase
  end

  if selected_planet == "mercury" || selected_planet == "1"
    puts mercury.present_info
  elsif selected_planet == "venus" || selected_planet == "2"
    puts venus.present_info
  elsif selected_planet == "earth" || selected_planet == "3"
    puts earth.present_info
  elsif selected_planet == "mars" || selected_planet == "4"
    puts mars.present_info
  elsif selected_planet == "jupiter" || selected_planet == "5"
    puts jupiter.present_info
  elsif selected_planet == "saturn" || selected_planet == "6"
    puts saturn.present_info
  elsif selected_planet == "uranus" || selected_planet == "7"
    puts uranus.present_info
  elsif selected_planet == "neptune" || selected_planet == "8"
    puts neptune.present_info

  end

  puts "Would you like to select another planet? Y/N"
  continue = gets.chomp
end
