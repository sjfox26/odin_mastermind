class Board
  attr_reader :sequence, :send_feedback_to_player

  def initialize
    @colors = ['red', 'blue', 'yellow', 'green', 'white', 'orange']
    @sequence = @colors.shuffle[0..3]
  end

  def send_feedback_to_player(colors_array)
    #compare two arrays and send back a color sequence

    red_array = add_red(colors_array)
    white_array = add_white(colors_array)
    #BlankAdder(feedback)

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

  def BlankAdder(feedback)

  end

end