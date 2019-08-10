require './lib/credit_check'

print "Please enter the credit card number to check: "
check_number = gets.chomp

credit_card = CreditCard.new(check_number,5000)

if credit_card.is_valid?
  puts "The credit card number #{check_number} is valid."
else
  puts "The credit card number #{check_number} is not valid."
end
