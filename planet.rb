=begin
2/22/2016 - Solar System
Purpose: Let's make a planetary system!

Baseline

*Create a Planet class with a name attribute.
*You should be able to instantiate a new Planet object with an associated name.

Wave 1

Primary Requirements

  *Get creative! Give each instance of Planet at least five attributes.
    These could be diameters, mass, moons... whatever!
  --- DONT DO YET Allow these attributes to be set using a hash in initialize.
  *You should be able to create many different planets with different properties,
    like Mercury, Venus, Earth, Mars, Jupiter, etc.

Optional Enhancements

  Give each planet a rate of solar rotation
  Give each planet a @distance_from_the_sun attribute
  *Write a program that asks for user input to query the planets:
  *First, ask the user to select a planet they'd like to learn about.
  *Present the user with a list of planets from which they can choose. Something like:
    1. Mercury, 2. Venus, 3. Earth, 4. Secret Earth, 5. Mars, 6. Jupiter, ... 13. Exit
  *Provide the user with well formatted information about the planet
    (diameter, mass, number of moons, primary export, etc.)
  *Then ask the user for another planet.
=end

=begin
Wave 2

Primary Requirements

Create a SolarSystem class that has an attribute planets that has zero to many Planet instances.
There are a few different options for how to associate the planets with your solar system:
  Initialize the list of planets in the constructor of the solar system
  Create a method that adds a single planet to a solar system
  Create a method that adds a list of planets to the existing list of planets

Optional Enhancements

Ensure that the each planet has a @distance_from_the_sun attribute.
Using this data, add a method to determine the distance from any other planet
  (assuming planets are in a straight line from the sun)
Give your solar system a formation year (in earth years).
Define a method that returns the local year of the planet based on it's rotation since the beginning of the solar system
=end

#wave2 - we are making a more general class called Solar Solar_System

class Solar_System
  attr_reader :planet_array, :planet_hash

  def initialize(planets_array)
    @planet_array = planets_array #for some things an array is simpler (ie, printing)

    planet_hash = {}
      planets_array.each do |planet| # we want to store planets (variable names) within Solary System as a hash. We will do this by iterating over the array!
        planet_hash[planet.name] = planet
      end
      # this loop level of abstraction is way easier than inputting manually!
    @planet_hash = planet_hash  #but for most things an array might be simpler.  Nice to have both options!
  end

  def print_system_planets
      @planet_array.each do |planet|
        puts "      #{planet.name}" # tab for formatting (pretty)
      end
  end

  def add_new_planet
    puts "Cool!  So there is a new planet in our solar system. Why don't you tell me about it?"
    print "Name the new planet (no spaces, please)! > "
    name = gets.chomp
    puts "Please answer the following questions so I can update the Solar System records. If you don't know the answer, just hit enter."
    print "What is the planet's position from the sun? > " #this could end up with a funky result because we already ordered 9 Planets (the known planets in the solar system)
    position_from_sun = gets.chomp
    print "How many moons does it have? > "
    num_moons = gets.chomp
    print "What is its mass (in Earth masses)? > "
    mass = gets.chomp
    print "How long does one rotation take (in hours)? > "
    rotation = gets.chomp
    print "How long does one revolution take (in days)? > "
    revolution = gets.chomp
    print "What is its distance from the sun (in million miles)? > " #again, what if distance doesn't match order?
    distance_from_the_sun = gets.chomp

    new_planet = Planet.new(name: name, position_from_sun: position_from_sun, num_moons: num_moons,
      mass: mass, rotation: rotation, revolution: revolution, distance_from_the_sun: distance_from_the_sun)

    @planet_array << new_planet #update array
    @planet_hash[new_planet.name] = new_planet #update hash

  end


end

# Baseline - wave 1, creates class for Planets
class Planet
  attr_reader :name, :position_from_sun, :num_moons, :mass, :rotation, :revolution, :distance_from_the_sun

  def initialize(options)

    @name = options[:name]
    @position_from_sun = options[:position_from_sun] || "??"
    @num_moons = options[:num_moons] || "??"
    @mass = options[:mass] || "??" # in Earth masses
    @rotation = options[:rotation] || "??" #hours
    @revolution = options[:revolution] || "??" #days
    @distance_from_the_sun = options[:distance_from_the_sun] ||  "??" # million miles
    # added the default values of "??" incase user adds a planet without information.
    # Printing will still be nice with "??" in print_planet_specs
    # Didn't work as expected - will need to trouble shoot later.  Empty string made by immediately hitting enter is as truthy as "??"

  end

  def print_planet_specs

    puts "Here is what I know about #{@name}:

          It is the #{@position_from_sun} planet from the Sun!
          It has #{@num_moons} moons!
          It has a mass of #{@mass} Earth masses!
          It takes #{@rotation} hours to complete a rotation!
          It takes #{@revolution} days to go around the Sun!
          "
  end
end

mercury = Planet.new(name: "Mercury", position_from_sun: "first", num_moons: 0,
  mass: 0.0553, rotation: 1411.44, revolution: 87.97, distance_from_the_sun: 36)
venus = Planet.new(name: "Venus", position_from_sun: "second", num_moons: 0,
  mass: 0.815, rotation: 5848.56, revolution: 224.7, distance_from_the_sun: 67.2)
earth = Planet.new(name: "Earth", position_from_sun: "third", num_moons: 1,
  mass: 1, rotation: 23.9345, revolution: 365.26, distance_from_the_sun: 93)
mars = Planet.new(name: "Mars", position_from_sun: "fourth", num_moons: 2,
  mass: 0.107, rotation: 24.623, revolution: 686.98, distance_from_the_sun: 141.6)
jupiter = Planet.new(name: "Jupiter", position_from_sun: "fifth", num_moons: 63,
  mass: 317.83, rotation: 9.925, revolution: 4328.9, distance_from_the_sun: 483.6)
saturn = Planet.new(name: "Saturn", position_from_sun: "sixth", num_moons: 61,
   mass: 95.162, rotation: 10.5, revolution: 10752.9, distance_from_the_sun: 886.7)
uranus = Planet.new(name: "Uranus", position_from_sun: "seventh", num_moons: 32,
  mass: 14.536, revolution:  17.24, rotation: 30663.65, distance_from_the_sun: 1784.0)
neptune = Planet.new(name: "Neptune", position_from_sun: "eighth", num_moons: 18,
   mass: 17.147, revolution: 16.11, rotation: 60148.35, distance_from_the_sun: 2794.4)
pluto = Planet.new(name: "Pluto", position_from_sun: "ninth", num_moons: 3,
  mass: 0.0021, revolution: 153.72, rotation: 90403.2, distance_from_the_sun: 3674.5)

planets = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune, pluto]
#planets we know about!

solar_system = Solar_System.new(planets)

 puts "Hello!  I can tell you some things about the planets in the solar system!"

ask_for_planet = "Which planet would you like to learn about?"

puts ask_for_planet
solar_system.print_system_planets #this puts a list of planets, so we don't puts it
#we also can't set it equal to a variable because it returns nil (due to puts)
#prints all the planets we have stored in the solar system
#so the list updates as user adds more planets


prompt = "If you don't want to be here, please enter quit.
If you want to add a new planet, enter new.
Otherwise, enter a planet selection: > "
print prompt

while planet_choice = gets.chomp # loop while getting user input
   planet_choice.capitalize! #capitalize so the format matches, however the user inputs

  if solar_system.planet_hash[planet_choice] != nil #if we haven't made the planet, the hash will be nil.
  #Otherwise, it would return the variable/object of planet class.
     planet = solar_system.planet_hash[planet_choice]

     planet.print_planet_specs #prints out chunk of text about planets
     print prompt

  elsif planet_choice == "New" #will call a method from solar_system?
     solar_system.add_new_planet

     puts "That was great!  Thanks!"
     puts ask_for_planet
     solar_system.print_system_planets #puts possible_planets
     print prompt #print the prompt, so the user knows to re-enter input

  elsif planet_choice == "Quit"
       puts "That was fun - see you later :)."
       break #so we don't run this loop forever!

  else
       puts "That's not a planet I recognize.  Please try again!"

       puts ask_for_planet
       solar_system.print_system_planets #puts possible_planets
       print prompt #print the prompt, so the user knows to re-enter input
  end
end
