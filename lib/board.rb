class Board
  attr_reader :sequence, :send_feedback_to_player

  def initialize
    @colors = ['red', 'blue', 'yellow', 'green', 'white', 'orange']
    @sequence = @colors.shuffle[0..3]
  end

  def send_feedback_to_player(colors_array)
    #compare two arrays and send back a color sequence

    add_red(colors_array)
    #WhiteAdder(result)
    #BlankAdder(feedback)

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

  def WhiteAdder(result)

  end

  def BlankAdder(feedback)

  end

end