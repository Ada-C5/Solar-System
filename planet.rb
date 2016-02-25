#Create planet class that gets passed a hash with relevant info
class Planet
  attr_accessor :name, :moon_count, :gravity, :name_etymology,
                :cool_fact, :rotation_rate, :distance_from_the_sun

  def initialize(planet_hash)
    @name = planet_hash[:name]
    @moon_count = planet_hash[:moon_count]
    @gravity = planet_hash[:gravity]
    @name_etymology = planet_hash[:name_etymology]
    @cool_fact = planet_hash[:cool_fact]
    @rotation_rate = planet_hash[:rotation_rate]
    @distance_from_the_sun = planet_hash[:distance_from_the_sun]
  end

  # outputs info about the planet according to what was provided in the planet hash
  def summary
    planet_info = [
      {descriptor: @name, display: "‣ Let's learn about #{@name}! 💡"},
      {descriptor: @name_etymology, display: "‣ #{@name_etymology}  📜"},
      {descriptor: @moon_count, display: "‣ #{@name} has #{@moon_count} moons. 🌚"},
      {descriptor: @gravity, display: "‣ The gravity on #{@name} is #{@gravity} of Earth's. 🌍"},
      {descriptor: @rotation_rate, display: "‣ It takes #{@rotation_rate} for #{@name} to circle the Sun. 🌕"},
      {descriptor: @distance_from_the_sun, display: "‣ #{@name} is #{distance_with_commas} miles from the Sun. 🌞"},
      {descriptor: @cool_fact, display: "‣ Wanna hear something cool? #{@cool_fact} ⭐️"}
    ]
    puts "-" * 40
    planet_info.each do |desc|
      if desc[:descriptor] != nil
        puts desc[:display]
      end
    end
    puts "-" * 40  end

    # user friendly display of the large distance_from_the_sun numbers
    def distance_with_commas
      return @distance_from_the_sun.to_s.reverse.gsub(/(\d{3})(?=\d)/, '\\1,').reverse
    end
end

# Create a SolarSystem class that gets passed Planets
class SolarSystem
  attr_accessor :system_planets
  def initialize(planets)
    @system_planets = planets
    @planets_name_dist = []
  end

 # Take the system_planets array where planets can be in any order, then sort it
 # in a new array and sort based on the distance_from_the_sun values.
  def order_from_the_sun
  @planets_name_dist = []
    @system_planets.each do |planet|
      @planets_name_dist << {name: planet.name, distance: planet.distance_from_the_sun}
    end
    @ordered_planets = @planets_name_dist.sort_by { |planet| planet[:distance] }
    ordered_planet_names = []
    @ordered_planets.each do |planet|
      ordered_planet_names << planet[:name]
    end
    return ordered_planet_names
  end

# # Subtract one planet's distance from the other and absolute value
# # Can't seem to access the correct distance values correctly yet :(
#   def distance_between (planet1, planet2)
#     @system_planets.each do |planet|
#       if planet.name.include? planet1
#         planet1 = planet.name
#       elsif planet.name.include? planet2
#         planet2 = planet.name
#       end
#
#     end
#   end

  # list the planets in the SolarSystem
  def list_planets
    @system_planets.each do |planet|
      puts planet.name
    end
  end

  # find out what planet is at a given position (from the sun)
  def planet_at_position(position)
    order_from_the_sun
    return @ordered_planets[position - 1][:name]
  end

end

# Generates a random number with user selected amount of digits
# doesn't account for digits <= 0
def random_number(digits)
  if digits == 1
    return rand(0..9)
  else
    range_start = 10 ** (digits - 1)
    range_end = (10 ** (digits)) - 1
    return rand(range_start..range_end)
  end
end
# Generates a random letter from a to z
def random_letter
  return ("a".."z").to_a[rand(26)]
end
# Generate a random space id for user
def random_space_id
  "#{random_number(1)}#{random_letter.upcase}" +
  "#{random_number(3)}-#{random_number(2)}" +
  "#{random_letter.upcase}"
end

# Create 9 planets filled with cool info and put them in an array
mercury = Planet.new(name: "Mercury", distance_from_the_sun: 36_000_000)

venus = Planet.new(name: "Venus", moon_count: 0, gravity: "91%",
name_etymology: "Venus was named after the Roman goddess of love.",
cool_fact: "Venus is the hottest planet in our Solar System.",
rotation_rate: "224.68 Earth days", distance_from_the_sun: 67_200_000)

earth = Planet.new(name: "Earth", distance_from_the_sun: 93_000_000)

mars = Planet.new(name: "Mars", moon_count: 2, gravity: "38%",
name_etymology: "Mars was named after the Roman god of war.",
cool_fact: "The north and south poles of Mars are covered by " +
           "ice caps composed of frozen carbon dioxide and water.",
rotation_rate: "686.98 Earth days", distance_from_the_sun: 141_600_000)

jupiter = Planet.new(name: "Jupiter", distance_from_the_sun: 483_600_000)

saturn = Planet.new(name: "Saturn", moon_count: 33, gravity: "108%",
name_etymology: "Saturn was named for the Roman god of agriculture.",
cool_fact: "Saturn has beautiful rings \nthat are made mostly of ice chunks and some rock.",
rotation_rate: "29.456 Earth years", distance_from_the_sun: 886_700_000)

uranus = Planet.new(name: "Uranus", distance_from_the_sun: 1_784_000_000)

neptune = Planet.new(name: "Neptune", distance_from_the_sun: 2794_400_000)

pluto = Planet.new(name: "Pluto", distance_from_the_sun: 3674_500_000)

# Array for all planets, pass this to the SolarSystem class
planets = [mars, venus, saturn, pluto, uranus, earth, jupiter, mercury, neptune]

# Create new SolarSystem instance with my_planets
my_solarsystem = SolarSystem.new(planets)

# Ask user what planet they would like to learn about and display the info
# about that planet then allow them to choose another planet, or solar system
# and continue until they type exit.
puts "\n🚀  HELLO SPACE EXPLORER #{random_space_id}! 🚀"
puts "\nLet's get started."

picked_saturn = 0
pick_planet = nil
until pick_planet == "Exit"
  puts "What would you like to learn about?\n\n"
  planets.each do |planet|
    puts "- #{planet.name}"
  end

  puts "- Solar System"
  puts "Type Exit to quit the space learnin'.\n\n"

  if picked_saturn == 3
    puts "
SUPERRR SEECRETTTT SAATTUUURRNNN!!!!

            ,MMM8&&&.
       _...MMMMM88&&&&..._
    .::'''MMMMM88&&&&&&'''::.
   ::     MMMMM88&&&&&&     ::
   '::....MMMMM88&&&&&&....::'
      `''''MMMMM88&&&&''''`
            'MMM8&&&'
            "
    picked_saturn = 0
  end

  print "Subject: "

  pick_planet = gets.chomp.capitalize
  planets.each_index do |i|
    if planets[i].name.include? pick_planet
      puts planets[i].summary
      if pick_planet == "Saturn"
        picked_saturn += 1
      else
        picked_saturn = 0
      end
      break
    elsif pick_planet == "Solar system"
      break
    end
  end
  if pick_planet == "Solar system"
    puts "The Solar System"
    puts "-" * 40
    puts "‣ Here are the planets in this Solar System:"
    my_solarsystem.list_planets
    puts "-" * 40
    puts "‣ The fourth planet is #{my_solarsystem.planet_at_position(4)}."
    puts "-" * 40
    puts "‣ Here are the planets from closest to farthest from the sun:"
    puts my_solarsystem.order_from_the_sun
    puts "-" * 40
  end
  # pick_solarsystem = nil
  # until pick_solarsystem == "5" || "Back"
  #   puts "What would you like to find out?"
  #   solar_options = ["1 List all planets", "2 Planet order from the sun",
  #        "3 Distance between two planets", "4 Find a planet by position from the sun",
  #        "5 Back"]
  #   puts solar_options
  #   puts "Tell me... "
  #   pick_solarsystem = gets.chomp.capitalize
  #   case pick_solarsystem
  #     when "1", "List all planets"
  #       my_solarsystem.list_planets
  #     when "2", "Planet order from the sun"
  #       my_solarsystem.order_from_the_sun
  #     # when "3", "Distance between two planets"
  #     #   puts "What's the first planet?"
  #     #     planet1 = gets.chomp.capitalize
  #     #   puts "And the second planet?"
  #     #     planet2 = gets.chomp.capitalize
  #     #   puts "The distance between #{planet1} and #{planet2} is "
  #     when "4", "Find a planet by position from the sun"
  #       puts "What position should we check? (1-9)"
  #       user_position = gets.chomp
  #       puts "That's #{my_solarsystem.planet_at_position(user_position)}!"
  #   end
  # end
end

puts "Aw, little dipping out already?\n\n"
puts "    *   '*
                  *
                       *
                                *
                        *
                              *
                              "
