require 'yaml'
class SolarSystem
attr_accessor :planets, :age
  #attr_accessor :
  def initialize(system)
    @solarsystem = system
    @planets = {}
    @age = 4.6e9 #age in years
  end

  def add_planet(planet)
    @planets[planet.name] = planet

  end

  def display_planets
    puts @planets.to_yaml
  end

  def distance_between_planets(a, b)
    puts "\n#{a.name} and #{b.name} are #{(a.distance_from_the_sun - b.distance_from_the_sun).abs.round(0)} million kilometers away from each other."
  end

  def age_of_planet(planet)
    puts "\n#{planet.name} is #{(@age / planet.orbital_period).round} years old.  "
  end


end


class Planet
  attr_reader :name, :num_of_moons  , :made_of, :order_in_our_system, :gravity, :length_of_day, :distance_from_the_sun, :orbital_period
  def initialize(info)
    @name = info[:name]
    @num_of_moons = info[:num_of_moons]
    @made_of = info[:made_of]
    @order_in_our_system = info[:order_in_our_system]
    @gravity = info[:gravity]
    @length_of_day = info[:length_of_day] #in house
    @distance_from_the_sun = info[:distance_from_the_sun] # in millions of km
    @orbital_period = info[:orbital_period]
  end




  def show_info
    if @num_of_moons == 1
      plural = "moon"
    else @num_of_moons
      plural = "moons"
    end

    puts "\nHere is some info about the planet #{@name}, the #{@order_in_our_system} planet from the sun.
It has #{@num_of_moons} #{plural}, and is made of #{@made_of}.
Its gravity relative to earth is #{@gravity}, which means a 100 pound person would weigh #{(@gravity * 100).round(0)} pounds on #{@name}.
#{@name.capitalize} is #{@distance_from_the_sun} million kilometers from the sun, and each day on #{@name} is #{@length_of_day} hours long."

  end
end



@mercury = Planet.new(name:"Mercury", num_of_moons:0	, made_of:"rock and metal",	order_in_our_system: "first",	gravity:0.378,	length_of_day:4222.6,	distance_from_the_sun:57.9, orbital_period:0.241 )
@venus = Planet.new(name:"Venus", num_of_moons:0	,made_of:"rock and metal"	,order_in_our_system:"second",	gravity:0.907,	length_of_day:2802,	distance_from_the_sun:108.2, orbital_period:0.615)
@earth = Planet.new(name:"Earth", num_of_moons:1, made_of:"rock and metal", order_in_our_system:'third', gravity:1, length_of_day:24, distance_from_the_sun:149.6 , orbital_period:1)
@mars = Planet.new(name:"Mars", num_of_moons:2	,made_of:"rock and metal",	order_in_our_system:'fourth',	gravity:0.377,	length_of_day:24.7,	distance_from_the_sun:227.9, orbital_period:1.88)
@jupiter = Planet.new(name:"Jupiter", num_of_moons:67,	made_of:"gas",	order_in_our_system:'fifth'	,gravity:2.36,	length_of_day:9.9,	distance_from_the_sun:778.3, orbital_period:11.68)
@saturn = Planet.new(name:"Saturn", num_of_moons:62,	made_of:"gas"	, order_in_our_system:'sixth'	,gravity:0.916	,length_of_day:10.7	,distance_from_the_sun:1427, orbital_period:29.5)
@uranus = Planet.new(name:"Uranus", num_of_moons:27,	made_of:"gas"	,order_in_our_system:'seventh'	,gravity:0.889,	length_of_day:17.2,distance_from_the_sun:	2871, orbital_period:84)
@neptune = Planet.new(name:"Neptune", num_of_moons:14, made_of:'gas', order_in_our_system:'eighth', gravity:1.12, length_of_day:16.1,distance_from_the_sun:4497.1, orbital_period:164.8)
@pluto = Planet.new(name:"Pluto", num_of_moons:5	,made_of:"rock and metal",	order_in_our_system:'ninth'	,gravity:0.071	,length_of_day:153.3	,distance_from_the_sun:5913, orbital_period: 284)



@our_system = SolarSystem.new("Our System")
@our_system.add_planet(@mercury)
@our_system.add_planet(@venus)
@our_system.add_planet(@earth)
@our_system.add_planet(@mars)
@our_system.add_planet(@jupiter)
@our_system.add_planet(@saturn)
@our_system.add_planet(@uranus)
@our_system.add_planet(@neptune)
@our_system.add_planet(@pluto)

#@our_system.display_planets
#@our_system.distance_between_planets(@earth, @mars)
#@our_system.age_of_planet(@mars)

def list
  puts "
1. Mercury
2. Venus
3. Earth
4. Mars
5. Jupiter
6. Saturn
7. Uranus
8. Neptune
9. Pluto
"
end

#positives = %w(yes sure okay alright surely affirmative gladly yep fine naturally kinda )

def choose_planet

    puts "Select a planet by number:"
  choice = nil
    while !((1..9).include? choice)
        choice = gets.chomp.to_i
        case choice
        when 1 then planet1 = @mercury
        when 2 then planet1 = @venus
        when 3 then planet1 = @earth
        when 4 then planet1 = @mars
        when 5 then planet1 = @jupiter
        when 6 then planet1 = @saturn
        when 7 then planet1 = @uranus
        when 8 then planet1 = @neptune
        when 9 then planet1 = @pluto
        else
        puts "Not a choice, please enter a valid number for a planet:"
        choice = gets.chomp.to_i
        end
    end
    return planet1
end



def intro
    puts "\nWelcome to our universe! You can learn about the planets and solar systems here.
I can teach you about specific planets, or you may ask questions about our solar system."
end

def options
    puts "\nPlease type 'display' to learn about a specific planet.
Please type 'compare' to see how far apart two planets are from one another.
Please type 'age' to see how old a planet in our solar system would be in earth years.
Type 'exit' if you don't want to learn about the planets."
end



def display
    list
    planet1 = choose_planet
    planet1.show_info
end

def compare
      puts "\nYou can pick two planets and I will tell you how far apart from each other they
are when they're at their closest."
      list
      planet1 = choose_planet
      puts "And you'd like to know how far #{planet1.name} is from which other planet:"
      planet2 = choose_planet
      @our_system.distance_between_planets(planet1, planet2)
end

def age
  puts "Here you can find out how old a certain planet will be in earth years."
  list
  planet = choose_planet
  puts @our_system.age_of_planet(planet)
end

intro
response = 'yes'
positives = %w(y yes sure okay alright surely affirmative gladly yep yup fine naturally kinda )
while positives.include? response
  options
  choice = gets.chomp
  case choice
  when 'display' then display
  when 'compare' then compare
  when 'age' then age
  when 'exit' then exit
  else
    puts "Sorry, that is not a valid option. Please try again:"
  end
  puts "\nWould you like to learn more about the solar system?"
  response = gets.chomp
end
puts "Before you go, why didn't the aliens like the restaurant in space?"
answer = gets.chomp
puts "Because there was no atmosphere!\n"
