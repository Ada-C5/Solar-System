# Solar System
# Let's make a planetary system!
# Baseline
# 	• Create a Planet class with a name attribute.
# 	• You should be able to instantiate a new Planet object with an associated name.
# Wave 1
# Primary Requirements
# 	• Get creative! Give each instance of Planet at least five attributes. These could be diameters, mass, moons... whatever!
# 	• Allow these attributes to be set using a hash in initialize.
# You should be able to create many different planets with different properties, like Mercury, Venus, Earth, Mars, Jupiter, etc.

class Solar_system
  attr_accessor :planet1
  def initialize(planet) #planet array
    if planet_
      @planet1 = planet[:planet1]
      @planet2 = planet[:planet2]
    @print_solar_system = print_solar_system
  end

  def print_solar_system
    puts @name
  end

  def more_planets
    @planet

end

class Planet #declare a class called Planet
  attr_accessor :name , :moons, :fun #use attr_accessor attribute on instance name variable.
  def initialize(planet_options)
    @name = planet_options[:name] #string
    @moons = planet_options[:moons]
    @fun = planet_options[:fun]
  end
end

@earth = Planet.new(name: "Earth", moons: "1", fun: true)
@mars = Planet.new(name: "Mars", moons: "2", fun: true)

@solar_system = Solar_system.new(planet1: @earth, planet2: @mars)
