# say hello to user
# GET loan amount
# validate loan amount
# GET APR
# validate loan amount
# GET loan duration in years
# validate loan amount

# convert duration in years to months
# convert APR to monthly interest rate
# calculate monthly payment

# PRINT monthly interest rate
# PRINT loan duration in months
# PRINT monthly payment

# m = monthly payment
# p = loan amount
# j = monthly interest rate
# n = loan duration in months

# m = p * (j / (1 - (1 + j)**(-n)))

def prompt(message)
  puts("=> #{message}")
end

def valid_number?(num)
  num.to_f() != 0
end

prompt("Welcome to the mortgage calculator!")
prompt("How much, in US dollars, is your loan? $")
loan_amount_dollars = nil
loop do
  loan_amount_dollars = gets().chomp()
  if valid_number?(loan_amount_dollars)
    break
  else
    prompt("Not a valid dollar amount. Please only input a number.")
  end
end

prompt("What is your Annual Percentage Rate (APR) in percentage?")
annual_perc_rate = nil
loop do
  annual_perc_rate = gets().chomp()
  if valid_number?(annual_perc_rate)
    break
  else
    prompt("Not a valid percentage. Please only input a number.")
  end
end

prompt("How many years is your mortgage for?")
loan_duration_in_years = nil
loop do
  loan_duration_in_years = gets().chomp()
  if valid_number?(loan_duration_in_years)
    break
  else
    prompt("Not a valid number of years. Please only input a number.")
  end
end

loan_duration_in_months = loan_duration_in_years.to_f * 12
monthly_interest_rate = annual_perc_rate.to_f / 100 / 12
monthly_payment_dollars = loan_amount_dollars.to_f * (monthly_interest_rate /
  (1 - (1 + monthly_interest_rate)**(-loan_duration_in_months)))

prompt("Your monthly interest rate is #{monthly_interest_rate}%. ")
prompt("Your loan has a term of #{loan_duration_in_months.to_i} months. ")
prompt("Your monthly payment is $#{"%.2f" % monthly_payment_dollars}. ")
