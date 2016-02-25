class Planet
  attr_accessor :name, :mass_Me, :number_moons, :solar_year_in_earth_days, :distance_from_the_sun_in_au

  def initialize(planet_info)
      @name = planet_info[:name]
      @mass_Me = planet_info[:mass_Me]
      @number_moons = planet_info[:number_moons]
      @solar_year_in_earth_days = planet_info[:solar_year_in_earth_days]
      @distance_from_the_sun_in_au = planet_info[:distance_from_the_sun_in_au]
  end
end

#creates all of the planets in the solar system
#name, mass in Earth Mass, number of moons, Earth days/year and AU's from Sun
  @mercury = Planet.new(name: "Mercury", mass_Me: 0.0553, number_moons: 0, solar_year_in_earth_days: 88, distance_from_the_sun_in_au: 0.4)
  @venus = Planet.new(name: "Venus", mass_Me: 0.815, number_moons: 0, solar_year_in_earth_days: 224.7, distance_from_the_sun_in_au: 0.7)
  @earth = Planet.new(name: "Earth", mass_Me: 1, number_moons: 1, solar_year_in_earth_days: 365, distance_from_the_sun_in_au: 1.0)
  @mars = Planet.new(name: "Mars", mass_Me: 0.107, number_moons: 2, solar_year_in_earth_days: 685, distance_from_the_sun_in_au: 1.5)
  @jupiter = Planet.new(name: "Jupiter", mass_Me: 317.83, number_moons: 67, solar_year_in_earth_days: 4331.57, distance_from_the_sun_in_au: 5.2)
  @saturn = Planet.new(name: "Saturn", mass_Me: 95.162, number_moons: 150, solar_year_in_earth_days: 10759, distance_from_the_sun_in_au: 9.5)
  @uranus = Planet.new(name: "Uranus", mass_Me: 14.536, number_moons: 27, solar_year_in_earth_days: 30688.5, distance_from_the_sun_in_au: 19.6)
  @neptune = Planet.new(name: "Neptune", mass_Me: 7.147, number_moons: 14, solar_year_in_earth_days: 60190, distance_from_the_sun_in_au: 30.0)

  @list_of_planets = [@mercury, @venus, @earth, @mars, @jupiter, @saturn, @uranus, @neptune]

  play_again = true
  while play_again == true
    puts "The planets, from closest to the Sun are: Mercury, Venus, Earth, Mars, Jupiter, Saturn, Uranus, and Neptune"
    puts "Select a planet to learn about!"
    select = gets.chomp.downcase
    if select.include? ("mercury")
      puts "#{@mercury.name} is the closest planet to the sun, only #{@mercury.distance_from_the_sun_in_au} Astronomical Units away. It has #{@mercury.number_moons} moons, and its mass is #{@mercury.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@mercury.solar_year_in_earth_days} 24-hour days."
    elsif select.include? ("venus")
      puts "#{@venus.name} is the second closest planet to the sun, only #{@venus.distance_from_the_sun_in_au} Astronomical Units away. It has #{@venus.number_moons} moons, and its mass is #{@venus.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@venus.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "earth"
      puts "#{@earth.name} is the third closest planet to the sun, only #{@earth.distance_from_the_sun_in_au} Astronomical Units away. It has #{@earth.number_moons} moons, and its mass is #{@earth.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@earth.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "mars"
      puts "#{@mars.name} is the fourth planet from the sun, only #{@mars.distance_from_the_sun_in_au} Astronomical Units away. It has #{@mars.number_moons} moons, and its mass is #{@mars.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@mars.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "jupiter"
      puts "#{@jupiter.name} is the fifth planet from the sun, #{@jupiter.distance_from_the_sun_in_au} Astronomical Units away. It has #{@jupiter.number_moons} moons, and its mass is #{@jupiter.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@jupiter.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "saturn"
      puts "#{@saturn.name} is the sixth planet from the sun, #{@saturn.distance_from_the_sun_in_au} Astronomical Units away. It has #{@saturn.number_moons} moons, and its mass is #{@saturn.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@saturn.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "uranus"
      puts "#{@uranus.name} is the seventh planet from the sun, #{@uranus.distance_from_the_sun_in_au} Astronomical Units away. It has #{@uranus.number_moons} moons, and its mass is #{@uranus.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@uranus.solar_year_in_earth_days} 24-hour days."
    elsif select.include? "neptune"
      puts "#{@neptune.name} is farthest planet from the sun, #{@neptune.distance_from_the_sun_in_au} Astronomical Units away. It has #{@neptune.number_moons} moons, and its mass is #{@neptune.mass_Me} times that of planet Earth. One full orbit around the sun takes #{@neptune.solar_year_in_earth_days} 24-hour days."
    else
      puts "That is not a valid selection! Please try again with a planet name:"
      redo
    end
    puts "Would you like to learn about another planet?"
    another = gets.chomp.downcase
    if another.include? "n"
      play_again = false
    else
      redo
    end
  end
puts "Here is a visual representation of the order of the planets and the distances between them in AUs:"
print "SUN |-#{@mercury.distance_from_the_sun_in_au}-| MERCURY |-#{(@venus.distance_from_the_sun_in_au - @mercury.distance_from_the_sun_in_au).round(3)}-| VENUS |-#{(@earth.distance_from_the_sun_in_au - @venus.distance_from_the_sun_in_au).round(3)}-| EARTH |-#{(@mars.distance_from_the_sun_in_au - @earth.distance_from_the_sun_in_au).round(3)}-| MARS |-- #{(@jupiter.distance_from_the_sun_in_au - @mars.distance_from_the_sun_in_au).round(3)} ---| JUPITER"
puts " |--- #{(@saturn.distance_from_the_sun_in_au - @jupiter.distance_from_the_sun_in_au).round(3)} ---| SATURN |----- #{(@uranus.distance_from_the_sun_in_au - @saturn.distance_from_the_sun_in_au).round(3)} -----| URANUS |----- #{(@neptune.distance_from_the_sun_in_au - @uranus.distance_from_the_sun_in_au).round(3)} ------| NEPTUNE"




class SolarSystem
  attr_accessor :planets

  def initialize(number_planets_in_solar_system)
    @planets = number_planets_in_solar_system
  end

  def add_planet #creates new planet and adds to planet list
    puts "Enter a new planet name: "
    name = gets.chomp.downcase
    puts "Enter #{name}'s mass: "
    mass_Me = gets.chomp
    puts "Enter #{name}'s number of moons: "
    number_moons = gets.chomp
    puts "Enter #{name}'s orbit year in earth days: "
    solar_year_in_earth_days = gets.chomp.downcase
    puts "Enter #{name}'s distance from the Sun: "
    distance_from_the_sun_in_au = gets.chomp.downcase

    new_planet = Planet.new(name: name, mass_Me: mass_Me, number_moons: number_moons, solar_year_in_earth_days: solar_year_in_earth_days, distance_from_the_sun_in_au: distance_from_the_sun_in_au)
    @list_of_planets << new_planet
  end

end
