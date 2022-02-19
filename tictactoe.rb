class Board
  attr_accessor :board_array
  @@board_array = [0, 1, 2, 3, 4, 5, 6, 7, 8]
  @@board_array_val = [8, 1, 6, 3, 5, 7, 4, 9, 2]

  def initialize(player_one, player_two)
    @player_one = player_one
    @player_two = player_two
  end

  def display_board
    puts "\e[H\e[2J"
    @@board_array.each.with_index do |tile, index|
      print "\n" if index == 3 || index == 6 || index == 9
      print "| #{tile} |"
    end
  end

  def mark_board(tile_num, player)
    if player == @player_one
      @player_one.score += @@board_array_val[tile_num]
      @@board_array[tile_num] = 'X'
    else
      @player_two.score += @@board_array_val[tile_num]
      @@board_array[tile_num] = 'O'
    end
    display_board
    check_win
  end

  def check_win
    if @player_one.score == 15
      puts 'Player 1 wins'
    elsif @player_two.score == 15
      puts 'Player 2 wins'
    end
  end
end

class Player
  attr_accessor :name
  attr_accessor :score
  def initialize(name)
    @name = name
    @score = 0
  end
end

#MAIN

print 'Enter player 1 name: '
player_one_name = gets.chomp

print 'Enter player 2 name: '
player_two_name = gets.chomp

player_one = Player.new(player_one_name)
player_two = Player.new(player_two_name)

board = Board.new(player_one, player_two)
board.display_board

puts "\n\nPlayer One: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_one)

puts "\n\nPlayer Two: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_two)

puts "\n\nPlayer One: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_one)

puts "\n\nPlayer Two: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_two)

puts "\n\nPlayer One: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_one)

puts "\n\nPlayer Two: Enter tile to mark [0-8]:"
tile = (gets.chomp).to_i
board.mark_board(tile, player_two)

#TODO: make input iterable
