#!/usr/local/bin/ruby
#Name: Price Howard
#Date: 3/07/2021
#Class: CS-410W
#Purpose: To ask the user for the number of scores they want to input then loop the to get the scores and calculate the adverage then print to one decimal place.
print("How many scores? ")
score = gets.to_f
sum = 0
avg = 0.0
for i in 1..score do
  print("Enter score ##{i}: ")
  calcScore = gets.to_i
  sum = sum + calcScore
end
avg = sum / score
avg = avg.round(1)
puts("Average is #{avg}")

