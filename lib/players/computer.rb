module Players
  class Computer < Player

    def initialize(token)
      @token = token 
      @opponent_win_combo = []
      @corners = [1,3,7,9]
    end

    attr_accessor :opponent_win_combo
    attr_reader :corners

    def move(board_instance)

      if offence_defence == "0" # offence
        if board_instance.turn_count == 0
          position = corners[rand(4)].to_s
        elsif board_instance.turn_count == 1
          position = "5"
        else
          until(board_instance.valid_move?(position))
            position = rand(10)
          end
        end
      elsif offence_defence == "1" # defence
        position = (opponent_win_combo.find {|index| index == " "} + 1).to_s
      end
  #    position = rand(9)
  #
  #    end
  #    position.to_s
    end

    def offence_defence #0 = offence, 1 = defence
      offence_defence = "0"
      Game::WIN_COMBINATIONS.each do |combo|
          temp_combo = combo.select {|index| board_instance.cells[index] != self.token && board_instance.cells[index] != " "}
          if temp_combo.size == 2
            opponent_win_combo = temp_combo
            offence_defence = "1"
          end
      end
      offence_defence
    end

  end #class
end #module
