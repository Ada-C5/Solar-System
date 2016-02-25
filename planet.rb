# Lisa Rolczynski
# 2016-02-22

# Create a planet class that accepts a name argument
# Give it at least 5 attributes


class Planet
  attr_reader :name, :diameter_in_miles, :moons, :has_water, :mass_in_kg, :rings, :solar_orbit, :distance_from_the_sun

  def initialize(planet_characteristics)
    @name = planet_characteristics[:name]
    @diameter_in_miles = planet_characteristics[:diameter]
    @number_moons = planet_characteristics[:moons]
    @has_water = planet_characteristics[:water]
    @mass_in_kg = planet_characteristics[:mass]
    @rings = planet_characteristics[:rings]
    @solar_orbit = planet_characteristics[:solar_orbit]
    @distance_from_the_sun = planet_characteristics[:distance]
  

    if planet_characteristics[:water].nil?
      @has_water = false
    end
  end

  def get_planet_info
    info = <<-END
    Name: #{@name}
    Diameter (in miles): #{@diameter_in_miles}
    Number of moons: #{@number_moons}
    Has water? #{@has_water}
    Mass (in kg): #{@mass_in_kg}
    Number of rings? #{@rings}
    Solar orbit (in Earth days): #{@solar_orbit}
    Distance from the sun (in miles): #{@distance_from_the_sun}
    END
  end
end


class SolarSystem
  attr_accessor :list_of_planets # read and write
  attr_reader :formation_year # read only

  def initialize(system_hash)
    @list_of_planets = system_hash[:list]
    @formation_year = system_hash[:formation_year]

    if system_hash[:list].nil?
      @list_of_planets = []
    end
  end

  def add_planet(planet_to_add)
    @list_of_planets << planet_to_add
  end

# adds multiple planets in an array one by one to the @list_of_planets
  def add_multiple_planets(planets_to_add)
    planets_to_add.each do |obj|
      add_planet(obj)
    end
  end

  def determine_dist(planet_one_name, planet_two_name)
    planet_one = get_planet_by_name(planet_one_name)
    planet_two = get_planet_by_name(planet_two_name)
    if planet_one.nil? || planet_two.nil? # if the names the user entered don't match any names in planet list
      return nil
    end

    distance_one = planet_one.distance_from_the_sun
    distance_two = planet_two.distance_from_the_sun

    (distance_one - distance_two).abs # the distance between objects shouldn't be negative
  end

  def local_planet_year(planet_name)
    my_planet = get_planet_by_name(planet_name)
    if my_planet.nil?
      return nil
    end
    orbit_in_earth_days = my_planet.solar_orbit
    orbit_in_earth_years = orbit_in_earth_days / 365.245
    revolutions_since_formation = @formation_year / orbit_in_earth_years
    
    "%.3E" % revolutions_since_formation #returns value in scientific notation with 3 decimal places
  end

  def get_planet_by_name(planet_name)
    @list_of_planets.each do |element|
      if element.name == planet_name
        return element # returns if name matches, so will not reach the nil statement at the end of the method
      end
    end
    nil
  end

end


mercury = Planet.new(name: "Mercury", diameter: 3032, moons: 0, mass: 3.285e23, rings: 0, solar_orbit: 88, distance: 3.598e7)
venus = Planet.new(name: "Venus", diameter: 7520, moons: 0, mass: 4.867e24, rings: 0, solar_orbit: 224.7, distance: 6.724e7)
earth = Planet.new(name: "Earth", diameter: 7917, moons: 1, water: true, mass: 5.972e24, rings: 0, solar_orbit: 365.245, distance: 9.296e7)
mars = Planet.new(name: "Mars", diameter: 4212, moons: 2, water: true, mass: 6.39e23, solar_orbit: 687, distance: 1.416e8)
saturn = Planet.new(name: "Saturn", diameter: 72367, moons: 53, mass: 5.683e26, rings: 12, solar_orbit: (29.7 * 365.245), distance: 8.907e8)


planets = [mercury, venus, earth, mars, saturn]

my_solar_system = {list: planets, formation_year: 4.6e9}

existing_planets = SolarSystem.new(my_solar_system)


# unknown final number of planets (can change at any time), so number them based on index + 1
def show_planet_info(planets)
  done = false
  until done == true
    puts "Here are the available planets."
    planets.each_with_index do |element, index|
        puts "#{index + 1}. #{element.name}"
    end
    puts "#{planets.length + 1}. Exit"
    puts "\nWhich # would you like to learn more about?"
    input = gets.chomp.to_i
    if (1..planets.length).include? input
        info = planets[input - 1].get_planet_info
        puts info
        puts "\nWhat next?"
    elsif input == planets.length + 1
        puts "Sorry to see you go!  Goodbye!"
        done = true
    else
        puts "Invalid selection. Please try again."
    end
  end
end

def wants_planet_distance(solar_obj)
  puts "What is the distance between two planets, you ask?"
  puts "Here is the list of planets available."
  list_planet_names_in_solar(solar_obj)

  puts "What is the first planet you want to use?"
  user_planet_one = gets.chomp.capitalize
  
  puts "What about the second?"
  user_planet_two = gets.chomp.capitalize


  distance_between_planets = solar_obj.determine_dist(user_planet_one, user_planet_two)
  if distance_between_planets.nil?
    puts "Invalid entry. Sorry!"
  else
    puts "#{user_planet_one} and #{user_planet_two} are #{distance_between_planets} miles apart!"
  end
end

# returns a list of names of each planet within a solar system instance
def list_planet_names_in_solar(solar_obj)
  solar_obj.list_of_planets.each do |element|
    puts element.name
  end
end

def planet_rotations_around_sun(solar_obj)
  list_planet_names_in_solar(solar_obj)
  choice = gets.chomp.capitalize
  orbit = solar_obj.local_planet_year(choice)
  if orbit.nil?
    puts "Sorry. Not sure what you want from me!"
  else
    puts "#{choice} is #{orbit} local years old!"
  end
end


# prompt user for info to get the cycle started
puts "Welcome!! Please choose one of the following numbers:"
puts "1. get planet info"
puts "2. calculate planet distance"
puts "3. calculate local planet year"

which_choice = gets.chomp
if which_choice == "1"
  show_planet_info(planets)
elsif which_choice == "2"
  wants_planet_distance(existing_planets)
elsif which_choice == "3"
  planet_rotations_around_sun(existing_planets)
end





