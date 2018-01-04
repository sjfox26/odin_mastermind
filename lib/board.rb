class Board
  attr_reader :sequence, :send_feedback_to_player

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

  def send_feedback_to_player(colors_array)
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

end