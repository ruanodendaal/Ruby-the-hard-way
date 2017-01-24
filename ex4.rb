# Total cars
cars = 100
# Seats available in each cars
space_in_a_car = 4
# Total drivers we have
drivers = 30
# Total passengers for a given day
passengers = 90
# Available cars, where we need more drivers
cars_not_driven = cars - drivers
# A driver is needed for all cars so the relationship is 1-1
cars_driven = drivers
# Total capactiy = cars * available seats
carpool_capacity  = cars_driven * space_in_a_car
# If all cars are in use then this is the number of passengers required on ave per car
average_passengers_per_car = passengers / cars_driven

puts "There are #{cars} cars available."
puts "There are only #{drivers} drivers available"
puts "There will be #{cars_not_driven} empty cars today"
puts "We can transport #{carpool_capacity} people today"
puts "We have #{passengers} to carpool today"
puts "We need to put about #{average_passengers_per_car} in each car."
