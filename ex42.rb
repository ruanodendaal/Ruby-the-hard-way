## Animal is-a object look at the extra credit
class Animal
end


## Dog is-a Animal (inherits from type Animal)
class Dog < Animal
  def initialize(name)
    ## Dog has-a name
    @name = name
    puts "Wooff I'm #{name}"
  end
end

## Cat is-a Animal
class Cat < Animal

  def initialize(name)
    ## Cat has-a name
    @name = name
    puts "Meewwwoo I'm #{name}"
  end
end

## Person is-a object
class Person
  def initialize(name)
    ## Person has-a name
    @name = name

    ## Person has-a pet of some kind
    @pet = nil
    puts "My name is #{name} and my pet is #{pet}"
  end

  attr_accessor :pet
end

## Employee is-a type of Person
class Employee < Person

  def initialize(name, salary)
    ## Calls initialize in Person class
    super(name)
    ## Person has-a salary
    @salary = salary
    puts "My name is #{@name} and my salary is #{salary}"
  end
end

## Fish is an object
class Fish
end

## Salmon is-a Fish
class Salmon < Fish
end

## Halibut is-a Fish
class Halibut < Fish
end

## rover is-a Dog
rover = Dog.new("Rover")

## satan is-a Cat
satan = Cat.new("Satan")

## mary is-a Person
mary = Person.new("Mary")

## mary has-a pet called satan, write into @pet variable
mary.pet = satan

## frank is-a Employee
frank = Employee.new("Frank", 120000)

## frank has-a pet called rover, write into @pet
frank.pet = rover

## flipper is-a Fish
flipper = Fish.new()

## crouse is-a Salmon
crouse = Salmon.new()

## harry is-a Halibut
harry = Halibut.new()
