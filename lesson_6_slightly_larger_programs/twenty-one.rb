FULL_DECK = [['H', 'A'], ['H', '2'], ['H', '3'], ['H', '4'], ['H', '5'],
             ['H', '6'], ['H', '7'], ['H', '8'], ['H', '9'], ['H', '10'],
             ['H', 'J'], ['H', 'Q'], ['H', 'K'], ['D', 'A'], ['D', '2'],
             ['D', '3'], ['D', '4'], ['D', '5'], ['D', '6'], ['D', '7'],
             ['D', '8'], ['D', '9'], ['D', '10'], ['D', 'J'], ['D', 'Q'],
             ['D', 'K'], ['S', 'A'], ['S', '2'], ['S', '3'], ['S', '4'],
             ['S', '5'], ['S', '6'], ['S', '7'], ['S', '8'], ['S', '9'],
             ['S', '10'], ['S', 'J'], ['S', 'Q'], ['S', 'K'], ['C', 'A'],
             ['C', '2'], ['C', '3'], ['C', '4'], ['C', '5'], ['C', '6'],
             ['C', '7'], ['C', '8'], ['C', '9'], ['C', '10'], ['C', 'J'],
             ['C', 'Q'], ['C', 'K']]

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

def display_welcome
  system 'clear'
  prompt "Welcome to Twenty-One."
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
    prompt("Dealer's hand: #{cards_to_display} and an unknown card.")
  elsif dealer
    cards_to_display = joinor(hand.map { |n| n[1] })
    prompt("Dealer hand: #{cards_to_display}.")
  else
    cards_to_display = joinor(hand.map { |n| n[1] })
    prompt("Your hand: #{cards_to_display}.")
  end
end

# hand = [['H', 'A'], ['C', 'J']] # 21
# hand = [['S', '9'], ['C', 'J'], ['H', 'A']] # 20
def calculate_hand_total(hand)
  hand_values = hand.map { |card| CARD_VALUES[card[1]][0] }
  hand_total = hand_values.sum
  if hand_total > 21
    aces = hand.count { |_, value| value == 'A' }
    aces.times do
      if hand_total > 21
        hand_total -= 10
      end
    end
  end
  hand_total
end

def busted?(hand)
  calculate_hand_total(hand) > 21
end
  
def player_turn(hand, deck)
  loop do
    prompt("Do you want to hit or stay?")
    answer = gets.chomp.downcase
    break if answer == "stay"
    if answer == 'hit'
      hand += deck.shift(1)
      display_hand(hand)
    end
    if busted?(hand)
      prompt("You bust!")
      break
    end
  end
  hand
end

def dealer_turn(hand, deck)
  loop do
    hand_total = calculate_hand_total(hand)
    break if hand_total >= 17
    prompt("Dealer hits...")
    hand += deck.shift(1)
    display_hand(hand, dealer=true, hide_card=true)
    if busted?(hand)
      prompt("Dealer busts!")
      break
    end
  end
  hand
end

def reveal_hands(player_hand, dealer_hand)
  puts "----------------------------------"
  prompt("Revealing hands...")
  display_hand(dealer_hand, dealer=true)
  display_hand(player_hand)
end

def who_won?(player_hand, dealer_hand)
  player_score = calculate_hand_total(player_hand)
  dealer_score = calculate_hand_total(dealer_hand)
  if player_score > 21
    'Dealer'
  elsif dealer_score > 21
    'Player'
  elsif player_score > dealer_score
    'Player'
  elsif dealer_score > player_score
    'Dealer'
  end
end

def declare_winner(winner)
  if winner == 'Player'
    prompt("You win!")
  elsif winner == 'Dealer'
    prompt("Dealer wins!")
  else
    prompt("It's a tie!")
  end
end

def play_again?
  puts "----------------------------------"
  prompt "Do you want to play again? (y or n)"
  answer = gets.chomp
  answer.downcase.start_with?('y')
end

display_welcome

loop do
  current_deck = FULL_DECK.shuffle

  # 2. Deal cards to player and dealer

  player_hand = current_deck.shift(2)
  dealer_hand = current_deck.shift(2)

  display_hand(dealer_hand, dealer=true, hide_card=true)
  display_hand(player_hand)

  loop do
    player_hand = player_turn(player_hand, current_deck)
    break if busted?(player_hand)

    dealer_hand = dealer_turn(dealer_hand, current_deck)
    break
  end

  reveal_hands(player_hand, dealer_hand)
  winner = who_won?(player_hand, dealer_hand)
  declare_winner(winner)

  break unless play_again?
end
