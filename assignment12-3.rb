#!/usr/local/bin/ruby
#Name: Price Howard
#Date: 3/07/2021
#Class: CS-410W
#Purpose: To ask the user for the base that they are trying to find the power of that is less than 1,000,000. It will output the number and the base and power by looping through a count variable.
print("What is the base? ")
base = gets.to_i
count  = 0
powers = 0
while(base ** count < 1000000)
  powers = base ** count
  puts("#{base} to the power #{count} is #{powers}")
  count = count + 1
end

