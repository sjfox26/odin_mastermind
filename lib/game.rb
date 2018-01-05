require_relative 'board'

class Game
  attr_accessor :board

  def initialize
    @board = Board.new('hard')
  end

  def introduce_challenge
    puts "Hello, in this game you are Gandalf the Grey, the badass wizard. To enter the Mines of Moria, you must use your superior"
    puts "logic skills to guess the correct sequence of colors.\n\n"

    puts "At the beginning of the game, the wall will pick a sequence of 4, or 6 colors (depending on difficulty level)."
    puts "The wall will tell you how many colors you should guess.  There are no repeat colors!\n\n"

    puts "You will type in a sequence of colors (separated by commas), and the wall will give you hints back!\n\n"

    puts "Here's how the HINTS work:"
    puts "First, the wall will check if any of the colors you selected are the CORRECT COLOR IN THE CORRECT SPOT"
    puts "For however many of those in your sequence, the wall will return the color 'red' "
    puts "Then, the wall will check to see if any of the colors you selected are the CORRECT COLOR IN THE WRONG SPOT"
    puts "For however many of those in your sequence, the wall will return the color 'white'\n\n"

    puts "For exampple, if the wall returns one red and one white, that means that one of the colors you selected"
    puts "is in the correct spot, and another color you selected is included in the wall's hidden sequence.\n\n"
  end


  def play
    introduce_challenge
    board.reveal_sequence_development
    tries = 10
    while true
      result = board.check_if_correct_sequence
      break if result == true
#      code_returned = board.send_feedback_to_player
#      p code_returned
      tries = tries - 1
      puts "Attempts remaining: #{tries}\n\n"
      if tries == 0
        puts "You have been denied entry into the Mines of Moria!\n\n"
        puts "The correct sequence was #{board.sequence}"
        break
      end
    end
  end
end



game = Game.new
game.play
