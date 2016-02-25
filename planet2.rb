# Leah Petersen
# HW 2-23-16 Solar System Wave 2

## solar system class
class SolarSystem
	#initialize an array of planets  
	def initialize(planets, est_year)
		@planets = planets
		@est_year = est_year
	end
	#print out planets in order closest-farthest from sun
	def order_from_sun
		puts "Here is the planet order from the sun!"
		array = @planets.sort_by do |planet|
			planet.dist_from_sun
		end
		# iterate through array and grab name attribute from planet object
		array.each do |i|
			puts i.name
		end
	end
	#distance between planets
	def between(planet1, planet2)
		answer = planet1.dist_from_sun - planet2.dist_from_sun
		answer = answer.abs
		puts "#{planet1.name} is #{answer} kilometers from #{planet2.name}."
	end
	# local year
	def local_year(planet)
		est_days = @est_year * 365
		answer = est_days / planet.solar_rot
		answer = answer.round(2)
		puts "#{planet.name} has rotated its sun #{answer} times since the solar system was born!"
	end
end

## planet class
class Planet
	attr_accessor :name, :moons, :diameter, :solar_rot, :dist_from_sun
	def initialize(elements)
		@name          = elements[:name]
		@moons         = elements[:moons] || 0 #default to no moons
		@diameter      = elements[:diameter]
		@solar_rot     = elements[:solar_rot]
		@dist_from_sun = elements[:dist_from_sun]
	end
	def print_info
		info = "\n\nThis planet's name is #{@name}.\nIt has #{@moons} moon/s.\n#{@name} is #{@diameter} kilometers in diameter.\n#{@name} takes #{@solar_rot} days to orbit the sun.\nIt is #{@dist_from_sun} kilometers from its sun.\n\n"
		puts info		
	end
end

## test planets
@earth = Planet.new(name: "Earth", moons: 1, diameter: 12742, solar_rot: 365, dist_from_sun: 149600000)
@mars = Planet.new(name:"Mars", moons:2, diameter:6779, solar_rot:687, dist_from_sun:227900000)
@jupiter = Planet.new(name:"Jupiter", moons:63, diameter:139822, solar_rot:4332, dist_from_sun:778500000)
@mercury = Planet.new(name:"Mercury", diameter:4879, solar_rot:88, dist_from_sun:57910000)
@venus = Planet.new(name:"Venus", diameter:12104, solar_rot:224.7, dist_from_sun:108200000)

# put planets in array
planets = []
planets.push(@earth)
planets.push(@mars)
planets.push(@jupiter)
planets.push(@mercury)
planets.push(@venus)

# test solar system
@our_solarsystem = SolarSystem.new(planets, 235)

# prompt user to learn about planets until they enter 'quit'
learner = true 
while learner == true do
	# ask user what planet they want to learn about
	puts "Hi, what planet would you like to learn about - give me the number! (type 'quit' to stop)"
	# iterate through planets array and list them with a number 1....
	counter = 1
	planets.each do |planet|
		puts "#{counter}: #{planet.name}"
		counter += 1
	end
	# take in user choice, swap to int
	planet_num = gets.chomp
	# break loop when done learning 
	if planet_num == "quit"
		learner = false
		break
	end
	planet_num = planet_num.to_i
	# grab selected planet from array and print out information
	@planet = planets[planet_num - 1]
	@planet.print_info
end
