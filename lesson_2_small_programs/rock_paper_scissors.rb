VALID_CHOICES = %w(rock paper scissors lizard spock)

RPS_LOOKUP = {
  rock: %w(scissors spock),
  paper: %w(rock lizard),
  scissors: %w(lizard paper),
  spock: %w(spock scissors),
  lizard: %w(paper spock)
}

SHORTHAND_LOOKUP = {
  r: 'rock',
  p: 'paper',
  sc: 'scissors',
  sp: 'spock',
  l: 'lizard'
}

def prompt(message)
  Kernel.puts("=> #{message}")
end

def shorthand_to_full_choice(shorthand)
  SHORTHAND_LOOKUP[shorthand.to_sym]
end

def win?(first, second)
  RPS_LOOKUP[first.to_sym].include?(second)
end

def display_results(player, computer)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("You lost this round!")
  end
end

loop do
  player_wins = 0
  computer_wins = 0

  prompt("Welcome to #{VALID_CHOICES.join(', ')}. "\
         "First to 5 wins is the winner!")

  loop do
    choice = ''
    loop do
      prompt("Choose one: r, p, sc, l, sp")
      choice = Kernel.gets().chomp()

      if VALID_CHOICES.include?(choice)
        break
      elsif SHORTHAND_LOOKUP.include?(choice.to_sym)
        choice = shorthand_to_full_choice(choice)
        break
      else
        prompt("That's not a valid choice.")
      end
    end

    computer_choice = VALID_CHOICES.sample

    Kernel.puts("You chose #{choice}; "\
                "Computer chose #{computer_choice}.")

    display_results(choice, computer_choice)

    if win?(choice, computer_choice)
      player_wins += 1
    elsif win?(computer_choice, choice)
      computer_wins += 1
    end

    if player_wins == 5
      prompt("YOU ARE THE GRAND TOURNAMENT WINNER!!!")
      break
    elsif computer_wins == 5
      prompt("You lost the tournament...")
      break
    end
  end

  prompt("The final tournament score was #{player_wins} wins for you; "\
    "#{computer_wins} wins for the computer.")

  prompt("Play again? (y to continue)")
  again = Kernel.gets().chomp()
  break if not again.match("^[Yy]")
end

prompt("Thank you for playing. Goodbye!")

