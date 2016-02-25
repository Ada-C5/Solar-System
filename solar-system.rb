# Create a SolarSystem class that has an attribute planets that has zero to many Planet instances. 
# There are a few different options for how to associate the planets with your solar system:
# Initialize the list of planets in the constructor of the solar system
# Create a method that adds a single planet to a solar system
# Create a method that adds a list of planets to the existing list of planets

class SolarSystem

    attr_reader :planets, :beginning

    # create initializer
    def initialize(formation_of_solar_system, planet_array = [])
        @beginning = formation_of_solar_system
        @planets = planet_array
    end

    # method to add planets
    def add_planet(planet)
        @planets.push(planet)
    end

    # add a list of planets to the planets attribute
    def add_many_planets(array_of_planets)
        @planets.push(array_of_planets)
        @planets.flatten
    end

    # calculate the distance between two planets in the solar system
    def distance_between_planets(planet_one, planet_two)
        if planet_one.distance_from_the_sun >= planet_two.distance_from_the_sun
            miles_between_planets = planet_one.distance_from_the_sun - planet_two.distance_from_the_sun
            return miles_between_planets
        else
            miles_between_planets = planet_two.distance_from_the_sun - planet_one.distance_from_the_sun
            return miles_between_planets
        end
    end

    # tell you how old the planet is in earth years
    def age_of_planet(planet)
        # formula uses 60 for minutes in an hour and 60 for seconds in a minute 
        # should prefer variables (constants?)
        planet_age = ( Time.new - @beginning ) / ( planet.rate_of_rotation * 60 * 60 )
        planet_age_in_years = planet_age / (60 * 60 * 24 * 365)
        return planet_age_in_years
    end

    # write a method that sorts @planets to put them in order from closest to farthest from the sun
    def sort_planets
       @planets.sort! { |a, b| a.distance_from_the_sun <=> b.distance_from_the_sun }
    end

    # call .print_info for the specified planet
    def planet_info(identifier)
        if identifier.class == Fixnum
            puts planets[identifier - 1].print_info
        elsif identifier.class == String   
            wanted_planet = planets[planets.find_index{|planet| planet.name.downcase == identifier.downcase}]
            puts planets[wanted_planet].print_info
        end
    end
end

class Planet

    # make names and distance from the sun readable.
    attr_reader :name, :distance_from_the_sun, :rate_of_rotation

    # define how the planet is created and what attributes are needed
    def initialize(planet_hash)
        @name = planet_hash[:name] # what is the planet's name?
        @composition = planet_hash[:composition] # what is the planet's composition?
        @rate_of_rotation = planet_hash[:rate_of_rotation] # length of solar day in hours
        @distance_from_the_sun = planet_hash[:distance_from_the_sun] # how far is the planet from the sun in miles?
        @habitable = planet_hash[:habitable] # boolean, is this planet habitable by humans?
        @primary_element = planet_hash[:primary_element] # primary element found in atmosphere
    end

    # this will print out the info when someone queries a planet
    def print_info
        puts ""
        puts "Planet: #{ @name }"
        puts "This planet is a #{ @composition } planet!"
        puts "This planet's day is #{ @rate_of_rotation } hours long."
        puts "This planet is #{ @distance_from_the_sun } miles from the sun. (This is misleading because in space we measure by light-years!)"
        puts "The atmosphere of this planet is mostly #{ @primary_element }."
        puts "This planet is habitable by humans? (t/f) #{ @habitable }"        
    end
end

# create some planets and store their names in the planetary_system array

planetary_system = SolarSystem.new(Time.new - 3.1536e+16)

mars = Planet.new(name: "Mars", composition: "red dirt and rocks", rate_of_rotation: 4225, distance_from_the_sun: 980, habitable: true, primary_element: "carbon")
planetary_system.add_planet(mars)

tatooine = Planet.new(name: "Tatooine", composition: "sand", rate_of_rotation: 36, distance_from_the_sun: 1_000_000_000, habitable: false, primary_element: "scum and villainy")
planetary_system.add_planet(tatooine)

arrakis = Planet.new(name: "Arrakis", composition: "sand", rate_of_rotation: 17, distance_from_the_sun: 900, habitable: true, primary_element: "spice")
planetary_system.add_planet(arrakis)

atlantis = Planet.new(name: "Atlantis", composition: "water", rate_of_rotation: 25, distance_from_the_sun: 98267363, habitable: true, primary_element: "oxygen")
planetary_system.add_planet(atlantis)

# ask user for planet they want to research
puts "Welcome to the planetary information system!"
puts "Which of these planets would you like to learn more about?"

# set variable here to make iterating through menu simple.
planet_to_view = 0

while planet_to_view == 0
    # makes menu by iterating through array:
    planetary_system.planets.length.times do |number|
      puts "#{ number + 1 }. #{planetary_system.planets[number].name.capitalize}"
    end

    # also offers a termination if they're done learning about planets.
    puts "#{ planetary_system.planets.length + 1}. Exit"
    print "Selection: "
    planet_to_view = gets.chomp.to_i

    while planet_to_view > 0 && planet_to_view != (planetary_system.planets.length + 1)
        puts planetary_system.planets[planet_to_view - 1].print_info
        puts "Do you want to see another planet? (y/n) "
        another_planet = gets.chomp
        if another_planet == "y"
            planet_to_view = 0
        else
            planet_to_view = 5
        end
    end
end

# terminate the program.
if planet_to_view == 5
    puts "Thank you for using the planetary information system."
end