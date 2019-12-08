require 'pry'
class Board
attr_accessor :cells

def initialize
  self.reset!
end

def reset!
  self.cells = Array.new(9," ")
end

def display
  board_with_numbers = cells
  board_with_numbers = board_with_numbers.collect.with_index(1) do |cell,i|
    if cell == " "
      cell = "#{i}"
    elsif cell == "X"
      cell = "X"
    elsif cell == "O"
      cell = "O"
    end
  end

  puts " #{board_with_numbers[0]} | #{board_with_numbers[1]} | #{board_with_numbers[2]} "
  puts "-----------------------------------------"
  puts " #{board_with_numbers[3]} | #{board_with_numbers[4]} | #{board_with_numbers[5]} "
  puts "-----------------------------------------"
  puts " #{board_with_numbers[6]} | #{board_with_numbers[7]} | #{board_with_numbers[8]} "
end

def position(input)
  cells[(input.to_i - 1)]
end

def full?
  if cells.detect {|cell| cell == " "}
    false
  else
    true
  end
end

def turn_count
  cells.select{|cell| cell == "X" || cell == "O"}.size
end

def taken?(input)
  if position(input) != " "
    true
  else
    false
  end
end

def valid_move?(input)
  if (input.to_i - 1).between?(0,8) && !taken?(input)
    true
  else
    false
  end
end

def update(pos, player)
  self.cells[pos.to_i - 1 ] = player.token
end

end #end of class
