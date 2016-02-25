class Solar_system
  attr_accessor :planets
  def initialize(planets)
    @planets = planets
  end
  def find_by_index(index)
    return @planets[index]
  end
  def planet_index(choice)
    case choice
    when "mercury"
      planet  = find_by_index(0)
    when "venus"
      planet = find_by_index(1)
    when "earth"
      planet = find_by_index(2)
    when "mars"
      planet = find_by_index(3)
    when "jupiter"
      planet = find_by_index(4)
    when "saturn"
      planet = find_by_index(5)
    when "uranus"
      planet = find_by_index(6)
    when "neptune"
      planet = find_by_index(7)
    end
    planet.info_display
  end
  def distance_from_other_planets(planet1, planet2)

  end
end


class Planet
  attr_accessor :name, :mass, :life, :moons, :special_feature
  def initialize(planet_data)
    @name = planet_data[:name]
    @mass = planet_data[:mass]
    @life = planet_data[:life]
    @moons = planet_data[:moons]
    @special_feature = planet_data[:special_feature]
    @distance_from_the_sun = planet_data[:distance_from_the_sun]
  end
  # nicely formats and displays the values for a given planet's attributes
  def info_display
    puts "Name: #{@name}"
    puts "Mass: #{@mass}"
    if @life
      puts "IT HAS LIFE!!! WOW!!!"
    end
    puts "Number of Moons: #{@moons} moon(s)"
    puts "Special Feature: #{@special_feature}"
    puts "Distance from the Sun: #{@distance_from_the_sun} km"
  end
end


mercury = Planet.new(name: "Mercury", mass: "3.3011×10^23 kg", life: false, moons: 0, special_feature: "smallest", distance_from_the_sun: 57_900_000)
venus = Planet.new(name: "Venus", mass: "4.8675×10^24 kg", life: false, moons: 0, special_feature: "hottest", distance_from_the_sun: 108_200_000)
earth = Planet.new(name: "Earth", mass: "5.97237×10^24 kg", life: true, moons: 1, special_feature: "Nutella", distance_from_the_sun: 149_600_000)
mars = Planet.new(name: "Mars", mass: "6.4171×10^23 kg", life: false, moons: 2, special_feature: "redness", distance_from_the_sun: 227_900_000)
jupiter = Planet.new(name:"Jupiter", mass: "1.8986×10^27 kg", life: false, moons: 67, special_feature: "biggest", distance_from_the_sun: 778_300_000)
saturn = Planet.new(name: "Saturn", mass: "5.6836×10^26 kg", life: false, moons: 62, special_feature: "rings", distance_from_the_sun: 1_427_000_000)
uranus = Planet.new(name: "Uranus", mass: "(8.6810±0.0013)×10^25 kg", life: false, moon: 27, special_feature: "coldest", distance_from_the_sun: 2_871_000_000)
neptune = Planet.new(name: "Neptune", mass: "1.0243×10^26 kg", life: false, moon: 14, special_feature: "discovered by math", distance_from_the_sun: 5_913_000_000)

planet_list = [mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
super_system = Solar_system.new(planet_list)

# loops until user enters "done"
done = "no"
until done == "yes" || done == "y"
  puts "Which planet would you like to learn about?"
  planet_list.each_with_index do |planet, index|
    puts "#{index + 1}. #{planet.name}"
  end
  choice = gets.chomp.downcase
  super_system.planet_index(choice)
  puts "Are you done?"
  done = gets.chomp.downcase
end

# solar system method to calculate distance from any other planet
