
require "colorize"

class Planet
	attr_accessor :name,:moons,:living_things,:order,:distance_from_sun,:rings, :days_in_year

	def initialize(planet_hash)
		@name = planet_hash[:name]
		@moons = planet_hash[:moons]
		@living_things = planet_hash[:living_things]
		@order = planet_hash[:order]
		@distance_from_sun = planet_hash[:distance_from_sun]
		@rings = planet_hash[:rings]
		@days_in_year = planet_hash[:days_in_year]

		if planet_hash[:moons]==nil
			@moons = 0
		end

		if planet_hash[:rings]==nil
			@rings = 0
		end
	end
end

@bogus = Planet.new(name: "Bogus".colorize(:blue), moons:"39", living_things: "no", order:"6th", 
	distance_from_sun: 590009000.2, days_in_year: 2520)
@xterra = Planet.new(name: "X-terra".colorize(:yellow).colorize(:background => :red), moons:"2", living_things: "no", order:"5th", 
	distance_from_sun: 478300372, days_in_year: 1996)
@mussle = Planet.new(name: "Mussle".colorize(:pink), living_things: "has", order:"4th", 
	distance_from_sun: 382890821, days_in_year: 1401.2)
@boniva = Planet.new(name: "Boniva".colorize(:green).on_red.underline, moons:"2", living_things: "no", order:"3rd", 
	distance_from_sun: 328300132, rings: 4, days_in_year: 940)
@vantarctica = Planet.new(name: "Vantarctica", moons: "4", living_things: "has", order:"2nd", 
	distance_from_sun: 251244009, days_in_year: 599.45)
@berth = Planet.new(name: "Berth".colorize(:purple), moons:"1", living_things: "no", order:"1st", 
	distance_from_sun: 191348092, days_in_year: 365.25)

planets = []
planets = planets.push(@berth)
planets = planets.push(@vantarctica)
planets = planets.push(@boniva)
planets = planets.push(@mussle)
planets = planets.push(@xterra)
planets = planets.push(@bogus)


class SolarSystem
	attr_accessor :planet_list

	def initialize(planet_list)
		@planet_list = planet_list
	end

	def planets_output

		one =1

		@planet_list.each do |x|
			puts "#{one}. #{x.name}"
			one +=1
		end
	end

	def distance_calc
		puts "Which planet would you like the location of?"
		ask = gets.chomp.downcase

		@planet_list.each do |x|
			if ask == x.name.downcase 
				puts "Distance from #{x.name} to it's Sun is #{x.distance_from_sun} miles"
				for y in @planet_list
					distance = (x.distance_from_sun - y.distance_from_sun).abs.to_i
					if distance != 0
						puts "Distance from #{x.name} to #{y.name} is #{distance} miles"
						else
					end
				end
				else
			end
					
		end
	end
end

@solarsystem = SolarSystem.new(planets)

@solarsystem.planets_output
puts
@solarsystem.distance_calc