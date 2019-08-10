puts "Please enter the credit card number (exluding  the checksum digit) for which to calculate the check sum digit:"
card_number = gets.chomp

card_number_array = card_number.split('')
numbers = card_number_array.map { |string_number| string_number.to_i }
i = 0

numbers_times_two = []
numbers.reverse_each do |number|
  if i % 2 == 0
    numbers_times_two.push(number * 2)
  else
    numbers_times_two.push(number)
  end
  i += 1
end

summed_digits_over_10 = numbers_times_two.map do |number_by_two|
  if number_by_two > 9
    number_split = number_by_two.to_s.split('')
    number_sum = 0
    number_split.each do |string_number|
      number_sum += string_number.to_i
    end
    number_sum
  else
    number_by_two
  end
end

results_sum = 0
summed_digits_over_10.each { |number| results_sum += number }
times_9 = results_sum * 9
check_sum_digit = times_9.to_s[-1]

# puts "The results sum is #{results_sum}"
# puts "The times 9 number is #{times_9}"
puts "The check sum digit for card number #{card_number} is #{check_sum_digit}."
