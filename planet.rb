# GOOD NEWS EVERYONE 
# Maybe use notable episodes as an attribute, key characters from certain planets, main exports
# Add in Dogdoo 7 / Joke about Dogdoo 8

require 'pp'

futurama_planets = {
	"amazonia" => {
		 name: "Amazonia",
		 diameter: "4880 km",
		 mass: "0.0553 10^24 kg",  
		 moons: "2",
		 atmosphere: true,
		 rotation: "58.81 hours",
		 revolution: "87.97 days",
		 distance_from_sun: "0.387 astronomical units", # 1 AU = 149.6 million kilometers
		 has_life: "Giant Man-Hating Women"
	},
	"amphibios_9" => {
		 name: "Amphibios 9",
		 diameter: "3290 km",
		 mass: "0.0343 10^24 kg",  
		 moons: "0",
		 atmosphere: true,
		 rotation: "47.81 hours",
		 revolution: "176.97 days",
		 distance_from_sun: "0.182 astronomical units",
		 has_life: "Kif, Amphibiosans"
	},
	"colgate_8" => {
		 name: "Colgate 8",
		 diameter: "1260 km",
		 mass: "0.0129 10^24 kg",  
		 moons: "12",
		 atmosphere: false,
		 rotation: "12.31 hours",
		 revolution: "375.12 days",
		 distance_from_sun: "3.298 astronomical units",
		 has_life: "Toothbrushes"
	},
  "decapod_10" => {
	   name: "Decapod 10",
  	 diameter: "12,360 km",
  	 mass: "1.129 10^24 kg",  
	   moons: "2",
  	 atmosphere: true,
	   rotation: "23.31 hours",
	   revolution: "388.14 days",
  	 distance_from_sun: "2.597 astronomical units",
	   has_life: "Zoidberg, Decapodians"
	},
	"earth" => {
		 name: "Earth",
		 diameter: "12,742 km",
		 mass: "1.000 10^24 kg",  
		 moons: "1",
		 atmosphere: true,
		 rotation: "23.93 hours",
		 revolution: "365.26 days",
		 distance_from_sun: "1.524 astronomical units",
		 has_life: "Humans, Richard Nixon's Head"
	},
	"nerdanus_8" => {
		 name: "Nerdanus 8",
		 diameter: "45,960 km",
		 mass: "3.929 10^24 kg",  
		 moons: "18",
		 atmosphere: true,
		 rotation: "87.31 hours",
		 revolution: "985.14 days",
		 distance_from_sun: "7.982 astronomical units",
		 has_life: "The planet itself is a sentient nerd."
	},
	"omicron_persei_8" => {
		 name: "Omicron Persei 8",
		 diameter: "7305 km",
		 mass: "4.829 10^24 kg",  
		 moons: "3",
		 atmosphere: true,
		 rotation: "26.31 hours",
		 revolution: "295.12 days",
		 distance_from_sun: "2.471 astronomical units",
		 has_life: "Omicronians"
	},
	"wormulon" => {
		 name: "Wormulon",
		 diameter: "1811 km",
		 mass: "0.0132 10^24 kg",  
		 moons: "0",
		 atmosphere: true,
		 rotation: "90.31 hours",
		 revolution: "103.12 days",
		 distance_from_sun: "1.930 astronomical units",
		 has_life: "Slurm Worms"
	},
}

dogdoo_8 = {
		 name: "DogDoo 8",
		 diameter: nil,
		 mass: nil,  
		 moons: nil,
		 atmosphere: nil,
		 rotation: nil,
		 revolution: nil,
		 distance_from_sun: 0,
		 has_life: nil
}

class Planet

	attr_reader :name, :diameter, :mass, :moons,
							:atmosphere, :rotation, :revolution,
							:distance_from_sun, :has_life

	def initialize(planets)
	 @name = planets[:name]
	 @diameter = planets[:diameter]
	 @mass = planets[:mass]
	 @moons = planets[:moons]
	 @atmosphere = planets[:atmosphere]
	 @rotation = planets[:rotation]
	 @revolution = planets[:revolution]
	 @distance_from_sun = planets[:distance_from_sun] # 1 AU = 149.6 million kilometers
	 @has_life = planets[:has_life]
	end
end

class SolarSystem

	attr_accessor :planets_array

	def initialize(planets_array)
		@planets_array = planets_array
	end
end

# give the planet hash list the class Planet
def assign_planets(planets)
	planet_array = []
	planets.each do |key, value|
		planet_array << Planet.new(value)
	end
	return planet_array
end

#add in a single planet to an already established planet collection 
def add_planet(planet, planets_array)
	planet = Planet.new(planet)
	planets_array << planet
	return planets_array
end 


# assign planet class to planets
futurama_planet_array = assign_planets(futurama_planets)

# assign SolarSystem class to the planet array 
futurama_solar_system = SolarSystem.new(futurama_planet_array)

# add a planet to the exsting array of planets 
futurama_planet_array = add_planet(dogdoo_8, futurama_planet_array)
