require 'pry'

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
             ['C', 'Q'],['C', 'K']]

CARD_VALUES = {'A' => [11, 1],
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
               'K' => [10]}

# hand = [['H', 'A'], ['C', 'J']] # 21
# hand = [['S', '9'], ['C', 'J'], ['H', 'A']] # 20
def calculate_hand_total(hand)
  hand_values = hand.map do |card|
                  CARD_VALUES[card[1]][0]
                end
  hand_total = hand_values.sum
  if hand_total > 21
    aces = hand.count { |_, value| value == 'A'}
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
  puts "player's hand: #{hand.map { |n| n[1]} }"
  hand_total = calculate_hand_total(hand)
  loop do
    puts "hit or stay?"
    answer = gets.chomp.downcase
    break if answer == "stay"
    if answer == 'hit'
      hand += deck.shift(1)
    end
    break if busted?(hand)
  end
  puts "player's hand: #{hand.map { |n| n[1]} }"
  hand
end


def dealer_turn(hand, deck)
  puts "dealer's hand: #{hand.map { |n| n[1]} }"
  loop do
    hand_total = calculate_hand_total(hand)
    break if hand_total >= 17
    hand += deck.shift(1)
    break if busted?(hand)
  end
  puts "dealer's hand: #{hand.map { |n| n[1]} }"
  hand
end 


def who_won?(player_hand, dealer_hand)
  player_score = calculate_hand_total(player_hand)
  dealer_score = calculate_hand_total(dealer_hand)
  if player_score > 21
    'dealer'
  elsif dealer_score > 21
    'player'
  elsif player_score > dealer_score
    'player'
  elsif dealer_score > player_score
    'dealer'
  else
    nil
  end
end

def declare_winner(winner)
  if winner
    puts "#{winner} wins!"
  else
    puts "It's a tie!"
  end
end


# 1. Initialize deck

current_deck = FULL_DECK.shuffle

# 2. Deal cards to player and dealer

player_hand = current_deck.shift(2)
dealer_hand = current_deck.shift(2)

loop do 
# 3. Player turn: hit or stay
#  - repeat until bust or "stay"

  player_hand = player_turn(player_hand, current_deck)

# 4. If player bust, dealer wins.
  break if busted?(player_hand)

# 5. Dealer turn: hit or stay
#   - repeat until total >= 17

  dealer_hand = dealer_turn(dealer_hand, current_deck)

# 6. If dealer bust, player wins.
  break
end

# 7. Compare cards and declare winner.
winner = who_won?(player_hand, dealer_hand)
declare_winner(winner)
