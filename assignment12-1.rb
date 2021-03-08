#!/usr/local/bin/ruby
#Name: Price Howard
#Date: 3/07/2021
#Class: CS-410W
#Purpose: To ask the user for the price of their meal and calculate certain tip amounts and output the tip price and total price with each tip. Then loop though if the user wants to input another tip amount.
continue = 'Y'
mealPrice = 1
while(continue == 'Y')
  print("Input the price of your meal: ")
  mealPrice = gets.to_f
  puts "Invalid Input Meal Cost Cannot Be Negative." if mealPrice < 0
  if mealPrice > 0
    tenPercent = mealPrice * 0.10
    fifteenPercent = mealPrice * 0.15
    twentyPercent = mealPrice * 0.20
    totalMealTenPercent = mealPrice + tenPercent
    totalMealFifteenPercent = mealPrice + fifteenPercent
    totalMealTwentyPercent = mealPrice + twentyPercent
    tenPercent = tenPercent.round(1)
    fifteenPercent = fifteenPercent.round(2)
   twentyPercent =  twentyPercent.round(2)
    totalMealTenPercent = totalMealTenPercent.round(2)
    totalMealTwentyPercent = totalMealTwentyPercent.round(2)
    totalMealFifteenPercent = totalMealFifteenPercent.round(2)
    puts "10% tip is: #{tenPercent} "
    puts "15% tip is: #{fifteenPercent} "
    puts "20% tip is: #{twentyPercent} "
    puts "Total cost with 10% tip is: #{totalMealTenPercent} "
    puts "Total cost with 15% tip is: #{totalMealFifteenPercent} "
    puts "total cost with 20% tip is: #{totalMealTwentyPercent} "
  end
  print("Continue? (Y/N): ")
  continue = gets.chomp!
  puts(continue)
  mealPrice = 1
end
  
