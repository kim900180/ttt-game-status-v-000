# Helper Method
def position_taken?(board, index)
  !(board[index].nil? || board[index] == " ")
end

# Define your WIN_COMBINATIONS constant
WIN_COMBINATIONS = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]

def won?(board)
  win_set = []
  WIN_COMBINATIONS.each do |set|
    if board[set[0]] == "O" && board[set[1]] == "O" &&  board[set[2]] == "O" && !full?(board)
      return set
    elsif board[set[0]] == "X" && board[set[1]] == "X" &&  board[set[2]] == "X" && !full?(board)
      return set
    elsif board[set[0]] == "O" && board[set[1]] == "O" &&  board[set[2]] == "O" && full?(board) == true
      return set
    elsif board[set[0]] == "X" && board[set[1]] == "X" &&  board[set[2]] == "X" && full?(board) == true
      return set
    elsif board.all? {|item| item == " "} || board.all? {|item| item == ""} || full?(board) == false
      return false
    end
  end
end

def full?(board)
  if board.any?{|item| item == ""} || board.any?{|item| item == " "}
    return false
  else
    return true
  end
end

def draw?(board)
  if !won?(board) && full?(board)
    return true
  else
    return false
  end
end

def over?(board)
  if won?(board) != false || full?(board) || draw?(board)
    return true
  elsif !won?(board) && !draw?(board)
    return false
  else
    return false
  end
end

def winner(board)
  win_set = won?(board)
  if win_set != false && board[win_set[0]] == "X"
    return "X"
  elsif win_set != false && board[win_set[0]] == "O"
    return "O"
  elsif win_set == false || draw?(board)
    return nil
  end
end
