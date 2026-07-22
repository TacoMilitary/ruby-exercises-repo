class Pet
  attr_reader :species, :name

  def initialize(*species_and_name)
    @species, @name = species_and_name
  end

  def to_s
    "a #{species} named #{name}"
  end
end

class Owner
  attr_reader :name, :adopted_pets

  def initialize(name)
    @name = name
    @adopted_pets = []
  end

  def give_pet(pet)
    @adopted_pets << pet
  end

  def number_of_pets
    adopted_pets.size
  end
end

class Shelter
  def initialize
    @past_adopters = []
  end

  def add_new_owner(new_owner)
    @past_adopters.push(new_owner).uniq!
  end

  def adopt(new_owner, pet)
    new_owner.give_pet(pet)
    add_new_owner(new_owner)
  end

  def print_adoptions
    @past_adopters.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      puts owner.adopted_pets
      puts "\n"
    end
  end
end

butterscotch = Pet.new('cat', 'Butterscotch')
pudding      = Pet.new('cat', 'Pudding')
darwin       = Pet.new('bearded dragon', 'Darwin')
kennedy      = Pet.new('dog', 'Kennedy')
sweetie      = Pet.new('parakeet', 'Sweetie Pie')
molly        = Pet.new('dog', 'Molly')
chester      = Pet.new('fish', 'Chester')

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new
shelter.adopt(phanson, butterscotch)
shelter.adopt(phanson, pudding)
shelter.adopt(phanson, darwin)
shelter.adopt(bholmes, kennedy)
shelter.adopt(bholmes, sweetie)
shelter.adopt(bholmes, molly)
shelter.adopt(bholmes, chester)
shelter.print_adoptions
puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."