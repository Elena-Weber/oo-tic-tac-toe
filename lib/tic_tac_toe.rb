class TicTacToe

def initialize(board = nil)
    @board = board || Array.new(9, " ")
end

WIN_COMBINATIONS = [[0,1,2], [3,4,5], [6,7,8], [0,3,6], [1,4,7], [2,5,8], [0,4,8], [6,4,2]]

def display_board
    puts " #{@board[0]} | #{@board[1]} | #{@board[2]} "
    puts "-----------"
    puts " #{@board[3]} | #{@board[4]} | #{@board[5]} "
    puts "-----------"
    puts " #{@board[6]} | #{@board[7]} | #{@board[8]} "
end

def input_to_index(input)
    input.to_i - 1
end

def move(index, token = "X")
    @board[index] = token
end

def position_taken?(index)
   if @board[index] == " " || @board[index] == nil || @board[index] == ""
    false
   elsif @board[index] == "X" || @board[index] == "O"
    true
   end
end

def valid_move?(index)
    if index.between?(0, 8) && !position_taken?(index)
      true
    else
      false
    end
end

def turn_count
    @board.select{|cell| cell == "X" || cell == "O"}.count
end

def current_player
    if turn_count.even?
        "X"
    else
        "O"
    end
end

def turn
    puts "Please enter 1-9:"
    input = gets.strip
    index = input_to_index(input)
    if valid_move?(index)
        move(index, current_player)
        display_board
    else
        turn
    end
end


def won?
    WIN_COMBINATIONS.detect do |combo|
        if @board[combo[0]] == "X" && @board[combo[1]] == "X" && @board[combo[2]] == "X"
            combo
        elsif @board[combo[0]] == "O" && @board[combo[1]] == "O" && @board[combo[2]] == "O"
            combo
        else
            false
        end
    end
end

def full?
    @board.all? do |cell|
    if cell == "X" || cell == "O"
        true
    else 
        false
    end
end
end

def draw?
    if full? && !won?
        true
    else
        false
    end
end

def over?
    if won? || draw?
        true
    else
        false
    end
end

def winner
    if won? && @board[won?[0]] == "X"
        "X"
    elsif won? && @board[won?[0]] == "O"
        "O"
    else
        nil
    end
end

def play
    display_board
    until over?
        turn
    end
    if winner
        puts "Congratulations #{winner}!"
    elsif draw?
        puts "Cat's Game!"
    end
end

end



