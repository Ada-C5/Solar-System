# Solar System 2.22.16 Justine Winnie
# Let's make a planetary system!
#
# Baseline
# Create a Planet class with a name attribute.
# You should be able to instantiate a new Planet object with an associated name.

#Wave 1
# Give each instance of Planet at least five attributes.
# Allow these attributes to be set using a hash in initialize.

#Additionals
# Give each planet a rate of solar rotation
# Give each planet a @distance_from_the_sun attribute
# Write a program that asks for user input to query the planets:
# First, ask the user to select a planet they'd like to learn about.
# Present the user with a list of planets from which they can choose. Something like:
# 1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit
# Provide the user with well formatted information about the planet (diameter, mass, number of moons, primary export, etc.)
# Then ask the user for another planet.

# Wave 2
# Create a SolarSystem class that has an attribute planets that has zero to many Planet instances.
#There are a few different options for how to associate the planets with your solar system:
# Initialize the list of planets in the constructor of the solar system
# Create a method that adds a single planet to a solar system
# Create a method that adds a list of planets to the existing list of planets


class Planet
  def initialize(planetdata)
    @name = planetdata[:name] #string
    @presence_of_water = planetdata[:water] #Boolean
    @taco_tuesday = planetdata[:taco_tuesday] #Boolean
    @atmosphere = planetdata[:atmosphere] #string
    @avg_temperature = planetdata[:avg_temperature] #float
    @solar_rotation = planetdata[:solar_rotation] #float
    @distance_from_the_sun = planetdata[:distance_from_the_sun] #float - expressed in miles because AMERICA
  end

  def taco_please
      puts @taco_tuesday
  end

  def name
    puts @name
  end
end

earth = Planet.new(name: "earth", taco_tuesday: "hells yes", distance_from_the_sun: 93000000)
mars = Planet.new(name: "mars", taco_tuesday: "no", distance_from_the_sun: 141633260)
unicornia = Planet.new(name: "unicornia", avg_temperature: "delightful", distance_from_the_sun: "pink clouds")

allplanets = [earth, mars, unicornia]

class SolarSystem
  def initialize
    @planets = []
  end

  def add_planet
    puts "What planet do you want to add?"
    planetoadd = gets.chomp
    @planets << planetoadd
  end

  def add_array(thearray)
    @planets.push(thearray)
    @planets.flatten
  end
end

# def list_planets
#     @planets.each do
#       puts @planets[:name]
#     end
# end

  # def add_planet_list
  #   puts "Enter a planet you'd like to add and hit enter."
  #   planet = gets.chomp
  #
  #   until planet.include? "All done!"
  #   puts "Enter another planet to add, followed by the enter key. If you're done, enter 'All done!'"
  #     planet = gets.chomp
  #     @planets << planet
  #   end
