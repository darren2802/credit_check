class CreditCard

  def initialize(card_number, card_limit)
    @card_number = card_number
    @card_limit = card_limit
  end

  attr_reader :card_number, :card_limit

  def is_valid?

    card_number_excl_sum_digit = card_number[0..-2]
    checksum_digit = card_number[-1].to_i

    card_number_array = card_number_excl_sum_digit.split('')
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

    results_sum = checksum_digit
    summed_digits_over_10.each { |number| results_sum += number }

    if results_sum % 10 == 0
      return true
    else
      return false
    end

  end

  def last_four
    card_number[-4,4]
  end

end

#card_number = "4024007106512380"

# Your Luhn Algorithm Here



# print numbers
# puts ""
# print numbers_times_two
# puts ""
# print summed_digits_over_10
# puts ""
# puts results_sum

# Output
## If it is valid, print "The number [card number] is valid!"
## If it is invalid, print "The number [card number] is invalid!"
