require "./lib/board_class"
require "./lib/players_class"

def play_game
  array = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  board = Board.new(array)
  player1 = Players.new("Ben", "X")
  player2 = Players.new("Dan", "0")
  turn = 0
  choice_vector = []
  current_player = player1

  until board.win?

    puts "#{current_player.nume} make a choice please:"
    choice = gets.chomp.to_i - 1

    while choice_vector.include?(choice)
      puts "There is already a mark there,pick something else"

      puts "#{current_player.nume} make a choice please:"
      choice = gets.chomp.to_i - 1

      break unless choice_vector.include?(choice)
    end

    board.update(choice, current_player.alegere)
    choice_vector.push(choice)
    turn += 1
    board.display

    if board.win?
      puts "#{current_player.nume} wins!"
      break
    elsif turn >= 9
      puts "TIE"
      break
    else
      current_player = current_player == player1 ? player2 : player1
    end
  end
end

play_game
