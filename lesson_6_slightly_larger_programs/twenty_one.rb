require 'pry'
require 'io/console'

GOAL_SCORE = 21

GOAL_WINS = 5

SCORE = { "Player" => 0,
          "Dealer" => 0 }

SUITS = %w(H S C D)
VALUES = %w(A 2 3 4 5 6 7 8 9 10 J Q K)
FULL_DECK = SUITS.product(VALUES)

CARD_VALUES = { 'A' => [11, 1],
                '2' => [2],
                '3' => [3],
                '4' => [4],
                '5' => [5],
                '6' => [6],
                '7' => [7],
                '8' => [8],
                '9' => [9],
                '10' => [10],
                'J' => [10],
                'Q' => [10],
                'K' => [10] }

def prompt(msg)
  puts "=> #{msg}"
end

def press_key_to_continue
  prompt "Press any key to continue."
  continue = STDIN.getch
  system 'clear' if continue
end

def display_welcome
  system 'clear'
  prompt "Welcome to #{GOAL_SCORE}."
  prompt "First to #{GOAL_WINS} points wins."
  puts "----------------------------------"
end

def joinor(arr,
           delimiter = ',',
           type = 'and')
  joined = ''
  arr = arr.map(&:to_s)
  if arr.length < 3
    joined << arr.join(' ' + type + ' ')
  else
    joined << arr[0, arr.length - 1].join(delimiter + ' ')
    joined << "#{delimiter} #{type} #{arr.last}"
  end
  joined
end

def display_hand(hand, dealer=false, hide_card=false)
  if dealer && hide_card
    cards_to_display = joinor(hand[1..hand.length].map { |n| n[1] })
    prompt("Dealer's hand: #{cards_to_display} plus an unknown card.")
  elsif dealer
    cards_to_display = joinor(hand.map { |n| n[1] })
    prompt("Dealer hand: #{cards_to_display} " \
      "for a total of #{calculate_hand_total(hand)}.")
  else
    cards_to_display = joinor(hand.map { |n| n[1] })
    prompt("Your hand: #{cards_to_display} " \
      "for a total of #{calculate_hand_total(hand)}.")
  end
end

def calculate_hand_total(hand)
  hand_values = hand.map { |card| CARD_VALUES[card[1]][0] }
  hand_total = hand_values.sum
  hand_total = calculate_for_aces(hand, hand_total)
  hand_total
end

def calculate_for_aces(hand, hand_total)
  if hand_total > GOAL_SCORE
    aces = hand.count { |_, value| value == 'A' }
    aces.times do
      if hand_total > GOAL_SCORE
        hand_total -= 10
      end
    end
  end
  hand_total
end

def busted?(hand)
  calculate_hand_total(hand) > GOAL_SCORE
end

def validate_choice(allowed_choices)
  answer = nil
  loop do
    answer = gets.chomp.downcase
    break if allowed_choices.include?(answer)
    prompt("Please choose a valid option (#{allowed_choices.join(' ')}).")
  end
  answer
end

def player_turn!(hand, deck)
  loop do
    prompt("Do you want to hit or stay (h or s)?")
    answer = validate_choice(%w(hit stay h s))
    if answer.start_with?('h')
      hand.append(deck.shift(1)[0])
      display_hand(hand)
      if busted?(hand)
        prompt("You bust!")
        break
      end
    else
      break
    end
  end
  hand
end

def dealer_turn!(hand, deck)
  loop do
    hand_total = calculate_hand_total(hand)
    break if hand_total >= GOAL_SCORE - 4
    prompt("Dealer hits...")
    hand.append(deck.shift(1)[0])
    display_hand(hand, dealer = true, hide_card = true)
    if busted?(hand)
      prompt("Dealer busts!")
      break
    end
  end
  hand
end

def reveal_hands(player_hand, dealer_hand)
  prompt("Revealing hands...")
  display_hand(dealer_hand, dealer = true, hide_card = false)
  display_hand(player_hand)
end

def who_won?(player_hand, dealer_hand)
  player_score = calculate_hand_total(player_hand)
  dealer_score = calculate_hand_total(dealer_hand)
  if busted?(player_hand)
    'Dealer'
  elsif busted?(dealer_hand)
    'Player'
  elsif player_score > dealer_score
    'Player'
  elsif dealer_score > player_score
    'Dealer'
  end
end

def display_winner(winner)
  if winner == 'Player'
    prompt("You win!")
  elsif winner == 'Dealer'
    prompt("Dealer wins!")
  else
    prompt("It's a tie!")
  end
end

def update_score(winner)
  if winner
    SCORE[winner] += 1
  end
end

def display_current_scores
  prompt "You have #{SCORE['Player']} points."
  prompt "Dealer has #{SCORE['Dealer']} points."
end

def play_again?
  puts "----------------------------------"
  prompt "Do you want to play again? (y or n)"
  answer = validate_choice(%w(yes no y n))
  answer.downcase.start_with?('y')
end

def someone_grand_winner?
  SCORE.values.any? { |n| n >= GOAL_WINS }
end

def display_grand_winner
  prompt "#{SCORE.max_by { |_, wins| wins }[0]} wins best out of #{GOAL_WINS}!"
end

def display_goodbye
  prompt "Thanks for playing #{GOAL_SCORE}. Goodbye!"
end

def reset_scores
  SCORE["Player"] = 0
  SCORE["Dealer"] = 0
end

loop do
  display_welcome
  reset_scores
  current_deck = FULL_DECK.shuffle
  loop do
    player_hand = current_deck.shift(2)
    dealer_hand = current_deck.shift(2)

    display_hand(dealer_hand, dealer = true, hide_card = true)
    display_hand(player_hand)

    loop do
      player_turn!(player_hand, current_deck)
      break if busted?(player_hand)

      dealer_turn!(dealer_hand, current_deck)
      break
    end

    reveal_hands(player_hand, dealer_hand)
    winner = who_won?(player_hand, dealer_hand)
    display_winner(winner)
    update_score(winner)

    break if someone_grand_winner?
    display_current_scores
    press_key_to_continue
  end

  display_grand_winner
  break unless play_again?
end
display_goodbye
