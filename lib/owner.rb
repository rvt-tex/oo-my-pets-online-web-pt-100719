class Owner
  attr_reader :name, :species

  @@all = []

  def initialize(name,species="human")
    @name = name
    @species = species
    @@all << self
  end

  def say_species
    "I am a #{@species}."
  end

  def self.all
    @@all
  end

  def self.count
    count = 0
    @@all.each { count += 1 }
    count
  end

  def self.reset_all
    @@all = []
  end

  def cats
    Cat.all.select{|cat| cat.owner == self}
  end

  def dogs
    Dog.all.select{|dog| dog.owner == self}
  end

  def buy_cat(name)
    Cat.new(name,self)
  end

  def buy_dog(name)
    Dog.new(name,self)
  end

  def walk_dogs
    dogs.each { |dog|
      dog.mood = "happy"
    }
  end

  def feed_cats
    cats.each { |cat|
      cat.mood = "happy"
    }
  end

  def sell_pets
    dogs.each { |dog|
      dog.mood = "nervous"
      dog.owner = nil
    }
    cats.each { |cat|
      cat.mood = "nervous"
      cat.owner = nil
    }
  end

  def list_pets
    dog_count = 0
    cat_count = 0

    dogs.each{ dog_count +=1 }
    cats.each{ cat_count +=1 }

    "I have #{dog_count} dog(s), and #{cat_count} cat(s)."
  end
end