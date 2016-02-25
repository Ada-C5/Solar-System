class Planet
  attr_accessor :name, :sparkle_spots
  def initialize(planets)
    @name = planets[:name]
    @diameter = planets[:diameter]
    @moon = planets[:moon]
    @color = planets[:color]
    @sparkle_spots = planets[:sparkle_spots]
    @water = planets[:water]
  sparkles

    water_option
  end

    def sparkles
      if @sparkle_spots >= 0
        # I want to put the amount of sparkles assigned
        puts "#{"*" * @sparkle_spots}"
      end
    end

    def water_option
      if @water == true
        puts "Your planet is inhabitiable"
      end
    end
end
# (planets is the variable key holding the hash)
# red is the value holding the key and values
# name, diameter....are the keys
# the answers are the values
group_of_planets = {
   red: {
     name: "reddish",
     diameter: 5,
     moon: "mighty",
     sparkle_spots: 15,
     water: true
   },

   blue: {
     name: "Bluesy",
     diameter: 8,
     moon: "out of style",
     sparkle_spots: 15,
     water: false
   },

  white: {
    name: "Whats up White Planet",
    diameter: 50,
    moon: "Fly guy",
    sparkle_spots: 4,
    water: true
  },

   pink: {
     name: "Pink Butterflies",
     diameter: 3,
     moon: "Icecream",
     sparkle_spots: 5,
     water: true
   },

   orange: {
     name: "Orange Cupcake",
     diameter: 8,
     moon: "Icing",
     sparkle_spots: 50,
     water: false
    }
 }
# instantiating the planet red
red = Planet.new(group_of_planets[:red])
p red
# access the specific object in the hash
p group_of_planets[:red][:moon]

class SolarSystem
  attr_accessor :planets
  def initialize(planets)
    @planets = planets # this is the same data structure from group_of_planets
  end

   # Create a method that adds a single planet to a solar system
   # add a single planet
   # planet_name = "brown",
   # planet_info = { name: "reddish", diameter: 5, moon: "mighty", sparkle_spots: 15, water: true }
  def add_planet(color, planet_hash)
    @planets[color] = planet_hash
  end
  # Create a method that adds a list of planets to the existing list of planets
  def add_many_planets(new_planet_hash)
    new_planet_hash.each do |color, planet_hash|
      add_planet(color, planet_hash)
      puts @planets #this a test
    end
    # new_planet_hash =
    # {
    #   pink: { name: "Pink Butterflies", diameter: 3, moon: "Icecream", sparkle_spots: 5, water: true },
    #   orange: { name: "Orange Cupcake", diameter: 8, moon: "Icing", sparkle_spots: 50, water: false }
    # }
  end
end
# new earth is the name of the SolarSystem
p new_earth = SolarSystem.new(group_of_planets)
p new_earth.add_planet(:Brown, {name: "Brownish", diameter: 10, moon: "Beauty", sparkle_spots: 8, water: false})
p new_earth.add_many_planets({"Green": {name: "Peas", diameter: 30, moon: "Sugar Snap", sparkle_spots: 45, water: true}, "Yellow": {diameter: 78.9, moon: "Mellow", sparkle_spots: 30, water: false}})


=begin
------------------------------------------------------------------------
In class example
class Address
    attr_accessor :first_name, :street_two
  def initialize(address_hash)
    @first_name  = address_hash[:first_name]
    @last_name   = address_hash[:last_name]
    @street_one  = address_hash[:street_one]
    @street_two  = address_hash[:street_two]
    @city        = address_hash[:city]
    @state       = address_hash[:state]
    @country     = address_hash[:country]
    @postal_code = address_hash[:postal_code]
  end
end
def print_address
  printy = "#{@first_name} #{@last_name}"
  return printy
end
end
addy = Address.new(first_name: "Jeremy", street_one: "somewhere",city: "Seattle")
addy.street_two = "apt 100000"
addy.first_name = "Still Jeremy"
addy.print_address = "Still Jeremy Flores"

=end
