require 'cat.rb'
require 'dog.rb'
require 'fish.rb'

class Owner
  @@all = []

  attr_reader :species
  attr_accessor :name, :pets


  def initialize(species="human")
    @@all << self
    @species = species
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def self.all
    @@all
  end

  def self.count
    self.all.length
  end

  def self.reset_all
    @@all = []
  end

  def say_species
    return   "I am a #{self.species}."
  end

  def pets
    return @pets
  end

  def buy_cat(cat_name)
    new_cat = Cat.new(cat_name)
    self.pets[:cats] << new_cat
  end

  def buy_dog(dog_name)
    new_dog = Dog.new(dog_name)
    self.pets[:dogs] << new_dog
  end

  def buy_fish(fish_name)
    new_fish = Fish.new(fish_name)
    self.pets[:fishes] << new_fish
  end

  def walk_dogs
    self.pets[:dogs].each do |individual_dog|
      individual_dog.mood = "happy"
    end
  end

  def play_with_cats
    self.pets[:cats].each do |individual_cat|
      individual_cat.mood = "happy"
    end
  end

  def feed_fish
    self.pets[:fishes].each do |individual_fish|
      individual_fish.mood = "happy"
    end
  end

  def sell_pets
    self.pets.each do |breed, animal_array|
      animal_array.each do |individual_animal|
        individual_animal.mood = "nervous"
      end
    end
    self.pets = {:fishes => [], :dogs => [], :cats => []}
  end

  def list_pets
    return "I have #{self.pets[:fishes].length} fish, #{self.pets[:dogs].length} dog(s), and #{self.pets[:cats].length} cat(s)."
  end
end
