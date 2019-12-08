module Players
  class Human < Player

    def move(board_instance)
      input = ""
      until board_instance.valid_move?(input) || input == "exit"
        puts "Where would you like to move? or type 'exit'"
        input = gets.chomp
      end
      input
    end

  end
end
