# ask the user for two numbers
# ask the user for the type of operation they want to perform
# perform the operation on the two numbers
# output the result

def prompt(message)
  Kernel.puts("=> #{message}")
end

def valid_number?(num)
  num.to_i() != 0
end

def operation_to_message(op)
  case op
  when '1'
    'Adding'
  when '2'
    'Subtracting'
  when '3'
    'Multiplying'
  when '4'
    'Dividing'
  end
end

prompt("Welcome to Calculator! Enter your name:")

name = ''
loop do
  name = Kernel.gets().chomp()
  if name.empty?()
    prompt("make sure to use a valid name.")
  else
    break
  end
end

prompt("Hi, #{name}.")

num1 = nil
num2 = nil

loop do
  loop do
    prompt("Enter the first number: ")
    num1 = Kernel.gets().chomp()
    if valid_number?(num1)
      break
    else
      prompt("That isn't a valid number.")
    end
  end

  loop do
    prompt("Enter the second number: ")
    num2 = Kernel.gets().chomp()
    if valid_number?(num2)
      break
    else
      prompt("That isn't a valid number.")
    end
  end

  operator_prompt = <<-MSG
    What operation would you like to perform?
        1) add
        2) subtract
        3) multiply
        4) divide
  MSG

  prompt(operator_prompt)

  operator = nil

  loop do
    operator = Kernel.gets().chomp()

    if %(1 2 3 4).include?(operator) # %w(1 2 3) returns array of 3 strings
      break
    else
      prompt("That isn't a valid operation. Please choose 1, 2, 3, or 4.")
    end
  end

  prompt("#{operation_to_message(operator)} the two numbers...")

  result = case operator
           when '1'
             num1.to_i + num2.to_i
           when '2'
             num1.to_i - num2.to_i
           when '3'
             num1.to_i * num2.to_i
           when '4'
             num1.to_f / num2.to_f
           end

  prompt("The result is #{result}!")

  prompt("Do you want to perform another calculation? (Y to calculate again)")
  answer = Kernel.gets().chomp()
  break unless answer.downcase().start_with?('y')
end

prompt("Thank you for using Calculator.")
