require_relative 'board'

class Wizard
  attr_reader :board

  def initialize
    @board = Board.new
  end

  def introduce_challenge

    puts "Hello, my name is Gandalf. To enter the Mines of Moria, you must guess the correct sequence of colors.\n\n"

    puts "At the beginning of the game, the wall will pick a sequence of 4 or 6 colored lights (depending on difficulty),"
    puts "each one being one of any of 4, 6, or 8 colors (depending on difficulty). The object of the game is to guess"
    puts "the exact colors in the exact order in the wall's hidden sequence, in as few guesses as possible. After each guess,"
    puts "the wall will give you a response showing how close your guess was.\n\n"

    puts "For each correct color in the sequence, the wall will show a white light. If the color is in the correct spot,"
    puts "the wall will show a red light.  The red lights will appear first, and do not necessarily correspond to the location of"
    puts "the color.  That's where your brain comes in.\n\n"

    #ask_for_sequence

  end

  def ask_for_sequence
    puts "Tell me your guesses by inputting a sequence of colors, for instance:\n\n"
    puts "red, green, blue, yellow\n\n"
    puts "is a guess for a sequence of red, green, blue, and yellow\n\n"
    puts "Available colors are: red, green, blue, yellow, white, and orange.\n\n"
    puts "Don't forget to separate your colors by commas. There are no repeat colors.\n\n"
  end

  def get_player_sequence
    ask_for_sequence
    player_sequence = gets.chomp
    player_sequence.split(', ')    #use ER splotch or whatever it was called method?
  end

  def reveal_sequence
    puts "******The correct sequence is actually #{board.sequence}\n\n"
  end


  def check_if_correct_sequence
    perfect_match = false
    @player_guess_array = get_player_sequence
    if @player_guess_array == board.sequence
      perfect_match = true
      puts "You got it!  You may enter the Mines of Moria"
    end
    perfect_match
  end


  def play
    introduce_challenge
    reveal_sequence
    tries = 10
    while true
      result = check_if_correct_sequence
      break if result == true
      code_returned = board.send_feedback_to_player(@player_guess_array)
      p code_returned
      tries = tries - 1
      puts "Attempts remaining: #{tries}\n\n"
      if tries == 0
        puts "You have been denied entry into the Mines of Moria!\n\n"
        break
      end
    end
  end
end



gandalf = Wizard.new
gandalf.play

