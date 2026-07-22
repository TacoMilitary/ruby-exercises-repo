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
  STARTING_PETS = [Pet.new('cat', 'Butterscotch'),
                   Pet.new('cat', 'Pudding'),
                   Pet.new('bearded dragon', 'Darwin'),
                   Pet.new('dog', 'Kennedy'),
                   Pet.new('parakeet', 'Sweetie Pie'),
                   Pet.new('dog', 'Molly'),
                   Pet.new('fish', 'Chester')
                  ]

  def initialize
    @past_adopters = []
    @unadopted_pets = STARTING_PETS.dup.map!(&:dup)
  end

  def adopt(new_owner)
    pet = @unadopted_pets.delete_at(rand(0..number_of_pets))
    new_owner.give_pet pet
    add_new_owner new_owner
  end

  def add_new_pet(pet)
    @unadopted_pets << pet
  end

  def print_adoptions
    @past_adopters.each do |owner|
      puts "#{owner.name} has adopted the following pets:"
      puts owner.adopted_pets
      puts "\n"
    end
  end

  def print_remaining_pets
    puts "The Animal Shelter has the following unadopted pets:"
    puts @unadopted_pets
    puts "\n"
  end

  def number_of_pets
    @unadopted_pets.size
  end

  private

  def add_new_owner(new_owner)
    @past_adopters.push(new_owner).uniq!
  end
end

phanson = Owner.new('P Hanson')
bholmes = Owner.new('B Holmes')

shelter = Shelter.new



shelter.print_remaining_pets
shelter.adopt(phanson)
shelter.print_remaining_pets
shelter.print_adoptions

# shelter.adopt(phanson, pudding)
# shelter.adopt(phanson, darwin)
# shelter.adopt(bholmes, kennedy)
# shelter.adopt(bholmes, sweetie)
# shelter.adopt(bholmes, molly)
# shelter.adopt(bholmes, chester)
# shelter.print_adoptions
# puts "#{phanson.name} has #{phanson.number_of_pets} adopted pets."
# puts "#{bholmes.name} has #{bholmes.number_of_pets} adopted pets."