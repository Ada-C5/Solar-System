puts "Please select a planet that you want to learn about by submitting the corresponding number
1. Mercury\n
2. Venus\n
3. Earth\n
4. Secret Earth\n
5. Mars\n
6. Jupiter\n
7. Saturn\n
8. Uranus\n
9. Neptune\n
10. Pluto\n
11. Planet 9\n
12. Exit"
user_planet = gets.chomp.downcase

valid_op = ["Mercury", "Venus", "Earth", "Secret Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "
Pluto", "Planet 9", "Exit", ("1..12")]
while valid_op.include?(user_planet)
  puts "Please enter a valid planet or the number next in the list "
  user_planet = gets.chomp.downcase #Ask again if user input is no one of valid planet
  end

class Planet
  attr_accessor :name, :type, :moons, :gravity, :diameter, :solar_year, :distance_from_sun
  def initialize(planet_hash)
    @name = planet_hash[:name]
    @type = planet_hash[:type]
    @moons = planet_hash[:moons]
    @gravity = planet_hash[:gravity]
    @diameter = planet_hash[:diameter]
    @solar_year = planet_hash[:solar_year]
    @distance_from_sun = planet_hash[:distance_from_sun]
    puts "hello world"
  end
end

def mercury
  Planet.new(name: "Mercury", type: "Terrestreal", moons: "None", gravity: "3.7 m/s²",
  diameter: "3,031 miles", solar_year: "88 days", distance_from_sun: "36,000,000 miles")
end
def venus
  Planet.new(name: "Venus", type: "Terrestreal", moons: "None", gravity: "8.87 m/s²",
  diameter: "7,521 miles", solar_year: "224 days", distance_from_sun: "67,000,000 miles")
  end
def earth
  Planet.new( name: "Earth", type: "terrestreal", moons: "Moon", gravity: "9.807 m/s²",
  diameter: "7,926 miles", solar_year: "365.25 days", distance_from_sun: "92,960,000 miles")
  end
def mars
  Planet.new( name: "Mars", type: "terrestreal", moons: "The moons of Mars are Phobos and Deimos",
  gravity: "3.711 m/s²", diameter: "4,222 miles", solar_year: "687 days", distance_from_sun: "141,700,000 miles")
  end
def jupiter
  Planet.new(name: "Jupiter", type: "Gas giant",
  moons: "There are 67 known moons of Jupiter. The most massive of them, the four Galilean moons, were discovered in 1610 by Galileo Galilei are Europa, Ganymede, Io, Callisto, and Amalthea",
  gravity: "24.79 m/s²", diameter: "88,846 miles", solar_year: "11.86 years", distance_from_sun: "483,500,000 miles")
    end
def saturn
  Planet.new(
  name: "Saturn", type: "gas giant",
  moons: "62 moons with confirmed orbits, 53 of which have names and only 13 of which have diameters larger than 50 kilometers. In the other hand, the enormous Titan, which is larger than the planet Mercury",
  gravity: "10.44 m/s²", diameter: "74,900 miles",solar_year: "29 years",distance_from_sun: "888,750,000 miles")
  end
def uranus
  Planet.new(name: "Uranus", type: "ice giant",
  moons: "27 known moons, all of which are named after characters from the works of William Shakespeare and Alexander Pope, such as  Miranda, Titania, Oberon, Umbriel, Ariel, Puck, Cupid, and Mab.",
  gravity: "8.69 m/s²", diameter: "31,763 miles", solar_year: "84 years", distance_from_sun: "1,783,744,300 miles")
  end
def neptune
    Planet.new(name: "Neptune", type: "Ice giant",
    moons: "14 known moons, which are named for minor water deities in Greek mythology. Triton, Nereid, Larissa, Naiad, Proteus, Thalassa, Galatea, Despina, Psamathe, Laomedeia, Neso, Halimede, Sao, and S/2004 N 1",
    gravity: "11.15 m/s²", diameter: "30,779 miles", solar_year: "164.8 years", distance_from_sun: "2,797,770,000 miles")
      end
def pluto
  Planet.new(name: "Pluto", type: "dwarf", moons: "five moons down to a detection limit of about 1 km in diameter. In order of distance from Pluto, they are Charon, Styx, Nix, Kerberos, and Hydra.",
  gravity: "0.658 m/s²", diameter: "1473 miles", solar_year: "248 years", distance_from_sun: "2,756,902,000 to 4,583,190,000 miles")
  end

case user_planet
  when "1" || "mercury"
    result = earth
  when "2" || "venus"
 result = venus
  when "3" || "earth"
 result = earth
  when "4" || "secret earth"
 result = earth
  when "5" || "mars"
 result = mars
  when "6" || "jupiter"
 result = jupiter
  when "7" || "saturn"
 result = saturn
  when "8" || "uranus"
 result = uranus
  when "9" || "neptune"
 result = neptune
  when "10" || "pluto"
 result = pluto
  when "11" || "planet 9"
 result = planet_9
  else
   "error"
 end

 puts  "The " + result.type + " planet " + result.name + " has " + result.moons + ". Its gravity is " + result.gravity + "."

class Solar_system
 attr_accessor  :planets, :formation_year, :distance_from_any_other_planet

 def initialize(the_system)
   @planets = ["Mercury", "Venus", "Earth", "Secret Earth", "Mars", "Jupiter", "Saturn", "Uranus", "Neptune", "Pluto", "Planet 9"]
     @formation_year = the_system[:formation_year]
     @dist_other= the_system[:dist_other]
   end
   def add_planet
     new_planet do |x|
       new_planet = x.name
     @planets << new_planet
    end
   end
end

karlie = Planet.new(name: "Karlie", moons: "3", gravity: "7.8 m/s^2")


melissa = Solar_system.new(name: "antena", formation_year: "1989", dist_other: "I don't know yet")
puts
puts
puts melissa.planets


# if user_planet == "3" || user_planet == "Earth"
#   do earth_specs
#   puts "The" + earth.type + "planet" + earth.name + "has" + earth.moons + ". Its gravity is" + earth.gravity + "."
