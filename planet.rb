class SolarSystem
  attr_reader :planets

  def intialize(planets)
    planets.each do |planet|
      @planets[planet.name] = planet
    end
  end

  def add_planet(x)
    @planets[x.name] = x
  end

  def remove_planet(planet_name)
    @planets[planet_name] = nil
  end

  def name_of_planet(position)
    planet_in_position = @planets[position]

    planet_in_position.class #=> Planet
    planet_in_position.colonized? #=> true or false
    @planets[position].name
  end

  def distance_between(planet1, planet2)
    
  end
end

class Planet
  attr_reader :name, :earth_age

  def initialize(options)
    @name      = options[:name]
    @mass      = options[:mass]
    @rotation  = options[:rotation]
    @earth_age = options[:earth_age]
    @distance  = options[:distance]
    @robots    = options[:robots]
  end

  def colonized?
    @robots == true
  end
end


earth = Planet.new(name: "Earth", mass: 32598234, robots: true)
mars = Planet.new(name: "Earth", mass: 23455, robots: true)
solar_system = SolarSystem.new(name: "Our solar system", planets: [earth, mars])

venus = Planet.new(name: "Venus", mass: 2343284092384, robots: true)
planet_dog_food = Planet.new(name: "Dog Food", mass 0, robots: false)

solar_system.add_planet(venus)
solar_system.add_planet(planet_dog_food)



planets = {
  "mercury" => Planet.new(),
  "venus" => Planet.new()
}
choice = gets.chomp.downcase
planets[choice]




