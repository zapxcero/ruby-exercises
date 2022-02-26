# frozen_string_literal: true

class Board
  def initialize(player1, player2)
    @player1 = player1
    @player2 = player2
    @board = %w[- - - - - - - - -]
    @game_running = true
  end

  def print_board
    puts "\e[H\e[2J"
    puts ''
    puts "| #{@board[0]} | #{@board[1]} | #{@board[2]} |"
    puts "| #{@board[3]} | #{@board[4]} | #{@board[5]} |"
    puts "| #{@board[6]} | #{@board[7]} | #{@board[8]} |"
  end

  def mark_board(player, tile)
    @board[tile] = player.mark unless tile_occupied?(tile)
  end

  def tile_occupied?(tile)
    return false if @board[tile] == '-'

    true
  end

  def winner?
    if @board[0] == @board[1] && @board[1] == @board[2] && @board[0] != '-'
      @game_running = false
      @board[0]
    elsif @board[3] == @board[4] && @board[4] == @board[5] && @board[3] != '-'
      @game_running = false
      @board[3]
    elsif @board[6] == @board[7] && @board[7] == @board[8] && @board[6] != '-'
      @game_running = false
      @board[6]
    elsif @board[0] == @board[3] && @board[3] == @board[6] && @board[0] != '-'
      @game_running = false
      @board[0]
    elsif @board[1] == @board[4] && @board[4] == @board[7] && @board[1] != '-'
      @game_running = false
      @board[1]
    elsif @board[2] == @board[5] && @board[5] == @board[8] && @board[2] != '-'
      @game_running = false
      @board[2]
    elsif @board[0] == @board[4] && @board[0] == @board[8] && @board[0] != '-'
      @game_running = false
      @board[0]
    elsif @board[2] == @board[4] && @board[2] == @board[6] && @board[2] != '-'
      @game_running = false
      @board[2]
    elsif !@board.include?('-')
      @game_running = false
      'Z'
    end
  end

  def input(player)
    print "Player #{player.name} please enter tile 0-8: "
    gets.chomp.to_i
  end

  def game
    loop do
      print_board
      tile = input(@player1)
      mark_board(@player1, tile)
      print_board
      case winner?
      when 'X'
        puts 'Player 1 wins!'
        break if @game_running == false
      when 'O'
        puts 'Player 2 wins!'
        break if @game_running == false
      when 'Z'
        puts "It's a tie!"
        break if @game_running == false
      end
      tile = input(@player2)
      mark_board(@player2, tile)
      print_board
      case winner?
      when 'X'
        puts 'Player 1 wins!'
        break if @game_running == false
      when 'O'
        puts 'Player 2 wins!'
        break if @game_running == false
      when 'Z'
        puts "It's a tie!"
        break if @game_running == false
      end
      break if @game_running == false
    end
  end
end

class Player
  attr_accessor :mark, :name

  def initialize(name, mark)
    @name = name
    @mark = mark
  end
end

# MAIN

player1 = Player.new('Adrian', 'X')
player2 = Player.new('God', 'O')

board = Board.new(player1, player2)
board.game
