
  #why use an attr_reader or attr_writer...how to know which to use and when and why??
  #attr_reader, to read something but not change it....like first and last name but you dont want them to see the email address
  #attr_writer, most of the time ppl dont change first nam but might change their last name
  # addy.first_name ="adrianna"
  #attr_accessor lets you do both!!


class Planet
  attr_reader :name, :color, :robots, :moon_count, :cats, :distance_from_the_sun  # this makes these attributes accessible outside the class definition. in IRB it allows you to add a new Planet.new that you may not have yet, and the attr_accessor lets you write in new stuff and see the info in the method you call afterwards such as .describe....if it wasnt in your attr, you could still write it, but you woulnt see it.
  def initialize (hash)
    @name = hash [:name]
    @color = hash [:color]
    @robots = hash [:robots]
    @moon_count = hash [:moon_count]
    @cats = hash [:cats]
    #@solar_rotation = solar_rotation   .....I dont really understand what a solar rotation is.... it's confusing.....
    @distance_from_the_sun = hash [:distance_from_the_sun]
  end
  #def talk()    #defining a method called talk
    #puts "Hello! You invoked the talk method!"  #puts-ing a string, only happens if we call on it
  #end                                           #invoking is like calling on a method
  def description()
    return "#{@name} is a #{@color} colored planet, it has #{@moon_count} moons, and it's #{@distance_from_the_sun} from the Sun. It is #{@robots} that there are robots there, and it is #{@cats} that there are cats there."
  end
end

 #so methods within the class definition act like regular methods:
#c = '1' is defining a variable
#c.to_i <- this is a method which is returning a value, its not actually puts-ing anything...to get output, you need to puts ( or return ) the info
# this is why we use return!!

# planets.each do |planet|   # loop to which we are iterating through the planets array (0,1,2) and puts-ing the name attribute from each element
#   puts "#{planet.name} is a #{planet.color} planet!"
# end



planets = [            # this is creating an array which has 9 elements, each of the elements is an instance of the planet class
  Planet.new(name: "Earth", color: "blue", robots: "true", moon_count: 1, cats: "true", distance_from_the_sun: "92.96 million mi"),  # like houses built from a blueprint...each instance is like a new house based on the blueprint, with diff attributes like window color!
  Planet.new(name: "Mercury", color: "grey", robots: "false", moon_count: 0, cats: "false", distance_from_the_sun: "35.98 million mi"),
  Planet.new(name: "Venus", color: "orange", robots: "true", moon_count: 0, cats: "false", distance_from_the_sun: "67.24 million mi"),
  Planet.new(name: "Mars", color: "red", robots: "true", moon_count: 2, cats: "false", distance_from_the_sun: "141.6 million mi"),
  Planet.new(name: "Jupiter", color: "white, red, orange, brown, and yellow", robots: "false", moon_count: 63, cats: "false", distance_from_the_sun: "483.8 million mi"),
  Planet.new(name: "Saturn", color: "pale yellow", robots: "false", moon_count: 62, cats: "false", distance_from_the_sun: "890.7 million mi"),
  Planet.new(name: "Uranus", color: "pale blue", robots: "false", moon_count: 27, cats: "false", distance_from_the_sun: "1.787 billion mi"),
  Planet.new(name: "Neptune", color: "bright blue", robots: "false", moon_count: 13, cats: "false", distance_from_the_sun: "2.795 billion mi"),
  Planet.new(name: "Pluto", color: "brown-gold", robots: "false", moon_count: 5, cats: "false", distance_from_the_sun: "3.67 billion miles"),
]

#not in an array:
#planet_1 = Planet.new(name: "Earth", color: "blue", robots: "true", 1, "true", "92.96 million mi")
#planet_2 etc......
# then i could ask the user which planet they want to learn about
#see phone photo****
#remember in the if statement to == and to "" around a string




class Solar_System
attr_reader :planet :mercury, :earth, :mars, :venus, :jupiter, :saturn, :uranus, :neptune, :pluto
def initialize (hash)
  @planet = hash [:planet]
  @mercury = hash [:mercury]
  @earth = hash [:earth]
  @mars = hash [:mars]
  @venus = hash [:venus]
  @jupiter = hash [:jupiter]
  @saturn = hash [:saturn]
  @uranus = hash [:uranus]
  @neptune = hash [:neptune]
  @pluto = hash [:pluto]
end

def in_system
  return " #{@earth}, #{mercury}, #{mars}, #{venus}, #{jupter}, #{saturn}, #{neptune}, #{neptune}, and #{pluto}."


solar_system = Solar_System.new(merury: "Mercury", earth: "Earth", )


#class Solar_System
#  attr_accessor :planets
#  def initialize(planet)#argument, kind of like a pipe variable. you give the value to the argument when you use the function. The function is the initialize.
#      @planets = planets # left is attributes, right is values of the attributes.
                #an instance is a variable that has a value
#  end

#need to put these planets into the solar system....
#  def in_system
  #   planets.each do |planet|
#       return "#{planets.name}, "
#  end

#end


#puts "These planets are in the Solar System:"

#puts in_system  #??????????s

#gallifrey = Solar_System.new (planet)
#puts gallifrey
#it is putting gallifrey as memory, but not as info.
#not sure how to pass my planets array into this instance.



puts "Please select a planet from the list below by the number:"

planets.length.times do |i|          # in the each loop above, the |planet| iterates theough each ELEMENT whereas in an .length.times loop, the |i| iterates through each index
  puts "#{i+1}. #{planets[i].name}"  # The index is just a number, while an item is the thing that is inside. so to access the element, we have to use that index ....planets|i|.name....to reference the elements in the array
end                                   #this gives us a way to allow the user to just reference the number, if we just used an each we wouldnt know what the index was of each element....and since we're asking a user for an index, the index allows us to go back into the array and access the index they're asking for.
                                      # an each loop is good for when order doesnt matter, but times loop is good when you want to reference the index an element is at.
selection = gets.chomp.to_i - 1 # was to take away a number from the given input selection bc arrays start at 0

puts planets[selection].description #array, selection variable, description method in Class definition
