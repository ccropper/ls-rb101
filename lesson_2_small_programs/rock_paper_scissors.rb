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

def clear_screen
  system('clear') || system('cls')
end

def prompt(message, add_separator=false)
  Kernel.puts("=> #{message}")
  if add_separator
    prompt("----------------------------------")
  end
end

def display_welcome
  prompt("Welcome to #{VALID_CHOICES.join(', ')}!".upcase, add_separator=true)
  prompt("Scissors cuts paper.")
  prompt("Paper covers rock.")
  prompt("Rock crushes lizard.")
  prompt("Lizard poisons Spock.")
  prompt("Spock smashes scissors.")
  prompt("Scissors decapitates lizard.")
  prompt("Lizard eats paper.")
  prompt("Paper disproves Spock.")
  prompt("Spock vaporizes rock.")
  prompt("Rock crushes scissors.", add_separator=true)
  prompt("First to 5 wins is the tournament winner!")
end

def shorthand_to_full_choice(shorthand)
  SHORTHAND_LOOKUP[shorthand.to_sym]
end

def retrieve_user_choice
  loop do
    prompt("Choose one: r, p, sc, l, sp")
    choice = Kernel.gets().chomp()

    if VALID_CHOICES.include?(choice)
      return choice
    elsif SHORTHAND_LOOKUP.include?(choice.to_sym)
      choice = shorthand_to_full_choice(choice)
      return choice
    else
      prompt("That's not a valid choice.")
    end
  end
end

def display_choices(player_choice, computer_choice)
  Kernel.puts("You chose #{player_choice}; "\
              "Computer chose #{computer_choice}.")
end

def display_scores(scores)
  prompt("The score is #{scores[:player_wins]} wins for you; "\
         "#{scores[:computer_wins]} wins for the computer.", add_separator=true)
end

def win?(first, second)
  RPS_LOOKUP[first.to_sym].include?(second)
end

def record_results!(player, computer, scores)
  scores[:round] += 1
  if win?(player, computer)
    scores[:player_wins] += 1
  elsif win?(computer, player)
    scores[:computer_wins] += 1
  end
end

def display_results(player, computer, scores)
  if win?(player, computer)
    prompt("You won this round!")
  elsif win?(computer, player)
    prompt("You lost this round!")
  else
    prompt("You tied!")
  end
  display_scores(scores)
end

def display_round(scores)
  prompt("Round #{scores[:round]}...", add_separator=true)
end

def reset_round_and_scores!(scores)
  scores[:round] = 1
  scores[:player_wins] = 0
  scores[:computer_wins] = 0
end

def did_someone_win?(scores)
  scores[:player_wins] == 5 || scores[:computer_wins] == 5
end

def announce_winner(scores)
  if scores[:player_wins] > scores[:computer_wins]
    prompt("YOU WIN THE TOURNAMENT!!!")
  else
    prompt("You lost...")
  end
end

def play_again?
  again = nil
  loop do
    prompt("Play again? (y or n)")
    again = Kernel.gets().chomp()
    again = again.downcase
    break if %w(y n).include?(again)
    prompt("That's not a valid choice. Please choose y to continue or n to exit the game.")
  end
  again == 'y'
end

round_and_scores = {
  round: 0,
  player_wins: 0,
  computer_wins: 0,
}

loop do
  reset_round_and_scores!(round_and_scores)
  clear_screen
  display_welcome

  loop do
    display_round(round_and_scores)
    player_choice = retrieve_user_choice
    computer_choice = VALID_CHOICES.sample

    display_choices(player_choice, computer_choice)
    record_results!(player_choice, computer_choice, round_and_scores)
    display_results(player_choice, computer_choice, round_and_scores)
    
    loop do 
      prompt("Press enter to clear screen and continue. ")
      input = Kernel.gets.chomp
      break if input.empty?
    end
    
    clear_screen
    if did_someone_win?(round_and_scores)
      display_scores(round_and_scores)
      announce_winner(round_and_scores)
      break
    end
  end

  break if !play_again?
end

prompt("Thank you for playing. Goodbye!")
