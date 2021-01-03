require 'pry'
require 'io/console'

FIRST_PLAYER = 'choose'

WINNING_LINES = [[1, 2, 3], [4, 5, 6], [7, 8, 9]] +
                [[1, 5, 9], [3, 5, 7], [1, 4, 7]] +
                [[2, 5, 8], [3, 6, 9]]

INITIAL_MARKER = ' '
PLAYER_MARKER = 'X'
COMPUTER_MARKER = 'O'

SCORE = { "player" => 0,
          "computer" => 0 }

def prompt(msg)
  puts "=> #{msg}"
end

def joinor(arr,
           delimiter = ',',
           type = 'or')
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

def determine_first_player
  current_player = FIRST_PLAYER
  if FIRST_PLAYER == 'choose'
    loop do
      prompt "Who should go first? (computer or player)"
      current_player = STDIN.getch.downcase
      if current_player.start_with?('c')
        current_player = 'computer'
        break
      elsif current_player.start_with?('p')
        current_player = 'player'
        break
      end
      prompt "The valid choices are (c)omputer or (p)layer"
    end
  end
end

def alternate_player(current_player)
  if current_player == 'player'
    'computer'
  else
    'player'
  end
end

# rubocop: disable Metrics/AbcSize
def display_board(brd)
  system 'clear'
  puts "You're #{PLAYER_MARKER}. computer is #{COMPUTER_MARKER}."
  puts ""
  puts "     |     |"
  puts "  #{brd[1]}  |  #{brd[2]}  |  #{brd[3]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[4]}  |  #{brd[5]}  |  #{brd[6]}"
  puts "     |     |"
  puts "-----+-----+-----"
  puts "     |     |"
  puts "  #{brd[7]}  |  #{brd[8]}  |  #{brd[9]}"
  puts "     |     |"
  puts ""
end
# rubocop: enable Metrics/AbcSize

# board = {1 => ' ', 2 => ' ', 3 => ' '} and so on
def initialize_board
  new_board = {}
  (1..9).each { |num| new_board[num] = INITIAL_MARKER }
  new_board
end

def empty_squares(brd)
  brd.keys.select { |num| brd[num] == INITIAL_MARKER }
end

def place_piece!(brd, current_player)
  if current_player == 'player'
    player_places_piece!(brd)
  else
    computer_places_piece!(brd)
  end
end

def player_places_piece!(brd)
  square = nil
  loop do
    prompt "Choose a square (#{joinor(empty_squares(brd))}): "
    square = STDIN.getch.to_i
    break if empty_squares(brd).include?(square)
    prompt "Sorry, that's not a valid choice"
  end
  brd[square] = PLAYER_MARKER
end

def find_winning_square(brd, marker)
  square = nil
  WINNING_LINES.each do |line|
    if brd.values_at(*line).count(marker) == 2
      empty_winning_square = empty_squares(brd).select do |n|
        line.include?(n)
      end
      if empty_winning_square.length > 0
        square = empty_winning_square[0]
      end
    end
  end
  square
end

def computer_places_piece!(brd)
  square = nil
  loop do
    square = find_winning_square(brd, COMPUTER_MARKER)
    break if square
    square = find_winning_square(brd, PLAYER_MARKER)
    break if square
    if empty_squares(brd).include?(5)
      square = 5
    else
      square = empty_squares(brd).sample
    end
    break
  end
  brd[square] = COMPUTER_MARKER
end

def board_full?(brd)
  empty_squares(brd).empty?
end

def someone_won?(brd)
  !!detect_winner(brd) # !! turns value into boolean
end

def detect_winner(brd)
  WINNING_LINES.each do |line|
    # *line is the same as all values in arr (line[0], line[1], line[2])
    if brd.values_at(*line).count(PLAYER_MARKER) == 3
      return "player"
    elsif brd.values_at(*line).count(COMPUTER_MARKER) == 3
      return "computer"
    end
  end
  nil
end

system 'clear'
prompt "Welcome to Tic-Tac-Toe. First to 5 points wins."
first_player = determine_first_player

loop do
  board = initialize_board
  current_player = first_player

  loop do
    display_board(board)
    place_piece!(board, current_player)
    break if someone_won?(board) || board_full?(board)
    current_player = alternate_player(current_player)
  end

  display_board(board)

  if someone_won?(board)
    prompt "+1 point for #{detect_winner(board)}!"
    SCORE[detect_winner(board)] += 1
  else
    prompt "It's a tie!"
  end

  prompt "You have #{SCORE['player']} points."
  prompt "Cmputer has #{SCORE['computer']} points."
  break if SCORE.values.any? { |n| n >= 5 }
  prompt "Press any key to continue."
  continue = STDIN.getch
  system 'clear' if continue
end

prompt "#{SCORE.max_by { |_, wins| wins }[0]} wins the game!"
prompt "Thanks for playing Tic Tac Toe. Goodbye!"
