# frozen_string_literal: true

class Game
  def initialize
    @colors = %w[red green blue yellow brown orange black white]
    @game_running = true
    @code = @colors.sample(4)
    puts @code
    @user_color = []
    @hints = []
  end

  def ask_color
    4.times do |i|
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
      @hints.push('perfect') if @user_color[i] == @code[i]
      @hints.push('good') if @code.include?(element) && @hints[i].nil?
    end
  end

  def game
    rounds = 0
    puts "\nAvailable colors: red, green, blue, yellow, brown, orange, black, and white.\nCode length: 4\nNo duplicates.\n"

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

      if rounds >= 10
        puts "\n\nYou lose!"
        break
      end
    end
  end
end

start = Game.new
start.game
