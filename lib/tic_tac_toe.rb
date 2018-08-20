class TicTacToe
  WIN_COMBINATIONS=[
     [0,1,2],
     [3,4,5],
     [6,7,8],
     [0,3,6],
     [1,4,7],
     [2,5,8],
     [0,4,8],
     [6,4,2]
     ]
   
  def initialize
      @board=[" "]*9
  end
  
  def display_board
    puts(" #{@board[0]} | #{@board[1]} | #{@board[2]} ")
    puts("-----------")
    puts(" #{@board[3]} | #{@board[4]} | #{@board[5]} ")
    puts("-----------")
    puts(" #{@board[6]} | #{@board[7]} | #{@board[8]} ")
  end
  
  
  def input_to_index(input)
    input.to_i-1
  end
  
  def move(index,token)
    @board[index]=token
  end
  
  def position_taken?(index)
    @board[index]!=" "
  end
  
  def valid_move?(index)
    index<9 and index>-1 and position_taken?(index)==false
  end
  
  def turn_count
    @board.count{ |x| x!=" "}
  end
  
  def current_player
    turn_count%2==0 ? "X" : "O"
  end
  
  def won?
    WIN_COMBINATIONS.each do |c|
      return c if c.all?{|i| @board[i]=="X"} or c.all?{|i| @board[i]=="O"}
    end
    false
  end
  
  def full?
    @board.all?{ |x| x!=" "}
  end
  
  def draw?
    full? and (won? == false)
  end
  
  def over?
    won? or draw?
  end
  
  def winner
    return "X" if WIN_COMBINATIONS.any?{ |c| c.all?{|i| @board[i]=="X"}}
    return "O" if WIN_COMBINATIONS.any?{ |c| c.all?{|i| @board[i]=="O"}}
  end
    
  def turn
    valid=false
    while valid==false
      puts("Enter move")
      input=gets
      index=input_to_index(input)
      valid=valid_move?(index)
      if valid==false
        puts("invalid")
      end
    end
    move(index,current_player)
    display_board
  end
  
  def play
    while over? == false
      turn
    end
    if won?
      puts("Congratulations #{winner}!")
    else
      puts("Cat's Game!")
    end
  end
  
end