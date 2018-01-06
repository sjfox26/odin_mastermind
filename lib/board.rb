class Board
  attr_accessor :sequence, :send_feedback_to_player

  def initialize(level)
    @colors = ['red', 'blue', 'yellow', 'green', 'white', 'orange']
    #@sequence = @colors.shuffle[0..3]
    @level = level
    @sequence = initialize_by_difficulty(level)#
  end

  def initialize_by_difficulty(level)
    if level == 'easy'
      @colors.shuffle[0..3]
    elsif level == 'hard'
      @colors.shuffle[0..5]
    end
  end

  def ask_for_sequence
    puts "Available colors are: red, green, blue, yellow, white, and orange."
    puts "Don't forget to separate your colors by commas. Remember, no repeat colors.\n\n"

    puts "Tell me your guesses by inputting a sequence of colors, like so (for a four-color sequence):"
    puts "red, green, blue, yellow"
  end

  def reveal_sequence_development
    puts "******The correct sequence is actually #{sequence}\n\n"
    puts "The wall has chosen a sequence of #{sequence.length} colors. Good luck!\n\n"
  end

  def generate_feedback_code(colors_array)
    #compare two arrays and send back a color sequence

    red_array = add_red(colors_array)
    white_array = add_white(colors_array)
    #add_blanks(red_and_white_array)

    red_array + white_array

  end

  def add_red(colors_array)
    feedback = []
    i = 0
    while i < colors_array.length
      if colors_array[i] == sequence[i]
        feedback << 'red'
      end
      i += 1
    end
    return feedback
  end

  def add_white(colors_array)
    feedback = []
    i = 0
    while i < colors_array.length
      if sequence.include?(colors_array[i]) &&  sequence[i] != colors_array[i]
        feedback << 'white'
      end
      i += 1
    end
    return feedback
  end

  #def add_blanks(red_and_white_array)
  #end
  def get_player_sequence
    ask_for_sequence
    player_sequence = gets.chomp
    player_sequence.split(', ')    #use ER splotch or whatever it was called method?
  end

  def check_if_correct_sequence
    perfect_match = false
    @player_guess_array = get_player_sequence
    if @player_guess_array == sequence
      perfect_match = true
      puts "You got it!  You may enter the Mines of Moria"
    end
    hints_returned = generate_feedback_code(@player_guess_array)
    p hints_returned
    perfect_match
  end


end