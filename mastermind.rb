# frozen_string_literal: true

# A Mastermind Class
class Game
  def initialize
    @code_length = 5
    @colors = %w[red green blue yellow brown orange black white]
    @game_running = true
    @code = @colors.sample(@code_length)
    @user_color = []
    @hints = []
  end

  def ask_color
    @code_length.times do |i|
      print "\nEnter color for slot #{i + 1}: "
      @user_color.push(gets.chomp)
    end
  end

  def check_colors
    if @user_color == @code
      puts "\n\nYou've guessed it! You win!"
      @game_running = false
    end
    @user_color.each_with_index do |element, i|
      if element == @code[i]
        @hints.push('perfect')
      elsif @code.include?(element)
        @hints.push('good')
      else
        @hints.push('X')
      end
    end
  end

  def game
    rounds = 0
    puts "\nAvailable colors: red, green, blue, yellow, brown, orange, black, and white.\nCode length: #{@code_length}\nNo duplicates.\n"

    loop do
      rounds += 1
      puts "\nRound: #{rounds}"
      ask_color
      check_colors

      print "\nUser Choice: "
      p @user_color
      print "\nHints: "
      p @hints
      @user_color = []
      @hints = []
      break if @game_running == false

      next unless rounds >= 10

      puts "\n\nYou lose!\n"
      p @code
      break
    end
  end
end

start = Game.new
start.game
