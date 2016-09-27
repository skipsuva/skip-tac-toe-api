class HandleComputerMove

  attr_reader :game, :game_board

  def initialize(game_id)
    @game = Game.find(game_id)
    @game_board = game.game_data
  end

  def execute
    record_computer_move
  end


  private

  def record_computer_move
    computer_move_position = check_wins || check_blocks || pick_move

    game.make_computer_move!(computer_move_position)
  end

  def check_wins
    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_1_col_2"] == "X" && game_board["row_1_col_3"] == "X"
    return "row_1_col_2" if game_board["row_1_col_1"] == "X" && game_board["row_1_col_2"] == "" && game_board["row_1_col_3"] == "X"
    return "row_1_col_3" if game_board["row_1_col_1"] == "X" && game_board["row_1_col_2"] == "X" && game_board["row_1_col_3"] == ""

    return "row_2_col_1" if game_board["row_2_col_1"] == "" && game_board["row_2_col_2"] == "X" && game_board["row_2_col_3"] == "X"
    return "row_2_col_2" if game_board["row_2_col_1"] == "X" && game_board["row_2_col_2"] == "" && game_board["row_2_col_3"] == "X"
    return "row_2_col_3" if game_board["row_2_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_2_col_3"] == ""

    return "row_3_col_1" if game_board["row_3_col_1"] == "" && game_board["row_3_col_2"] == "X" && game_board["row_3_col_3"] == "X"
    return "row_3_col_2" if game_board["row_3_col_1"] == "X" && game_board["row_3_col_2"] == "" && game_board["row_3_col_3"] == "X"
    return "row_3_col_3" if game_board["row_3_col_1"] == "X" && game_board["row_3_col_2"] == "X" && game_board["row_3_col_3"] == ""

    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_2_col_1"] == "X" && game_board["row_3_col_1"] == "X"
    return "row_2_col_1" if game_board["row_1_col_1"] == "X" && game_board["row_2_col_1"] == "" && game_board["row_3_col_1"] == "X"
    return "row_3_col_1" if game_board["row_1_col_1"] == "X" && game_board["row_2_col_1"] == "X" && game_board["row_3_col_1"] == ""

    return "row_1_col_2" if game_board["row_1_col_2"] == "" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_2"] == "X"
    return "row_2_col_2" if game_board["row_1_col_2"] == "X" && game_board["row_2_col_2"] == "" && game_board["row_3_col_2"] == "X"
    return "row_3_col_2" if game_board["row_1_col_2"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_2"] == ""

    return "row_1_col_3" if game_board["row_1_col_3"] == "" && game_board["row_2_col_3"] == "X" && game_board["row_3_col_3"] == "X"
    return "row_2_col_3" if game_board["row_1_col_3"] == "X" && game_board["row_2_col_3"] == "" && game_board["row_3_col_3"] == "X"
    return "row_3_col_3" if game_board["row_1_col_3"] == "X" && game_board["row_2_col_3"] == "X" && game_board["row_3_col_3"] == ""

    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_3"] == "X"
    return "row_2_col_2" if game_board["row_1_col_1"] == "X" && game_board["row_2_col_2"] == "" && game_board["row_3_col_3"] == "X"
    return "row_3_col_3" if game_board["row_1_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_3"] == ""

    return "row_3_col_1" if game_board["row_3_col_1"] == "" && game_board["row_2_col_2"] == "X" && game_board["row_1_col_3"] == "X"
    return "row_2_col_2" if game_board["row_3_col_1"] == "X" && game_board["row_2_col_2"] == "" && game_board["row_1_col_3"] == "X"
    return "row_1_col_3" if game_board["row_3_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_1_col_3"] == ""
  end

  def check_blocks
    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_1_col_2"] == "O" && game_board["row_1_col_3"] == "O"
    return "row_1_col_2" if game_board["row_1_col_1"] == "O" && game_board["row_1_col_2"] == "" && game_board["row_1_col_3"] == "O"
    return "row_1_col_3" if game_board["row_1_col_1"] == "O" && game_board["row_1_col_2"] == "O" && game_board["row_1_col_3"] == ""

    return "row_2_col_1" if game_board["row_2_col_1"] == "" && game_board["row_2_col_2"] == "O" && game_board["row_2_col_3"] == "O"
    return "row_2_col_2" if game_board["row_2_col_1"] == "O" && game_board["row_2_col_2"] == "" && game_board["row_2_col_3"] == "O"
    return "row_2_col_3" if game_board["row_2_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_2_col_3"] == ""

    return "row_3_col_1" if game_board["row_3_col_1"] == "" && game_board["row_3_col_2"] == "O" && game_board["row_3_col_3"] == "O"
    return "row_3_col_2" if game_board["row_3_col_1"] == "O" && game_board["row_3_col_2"] == "" && game_board["row_3_col_3"] == "O"
    return "row_3_col_3" if game_board["row_3_col_1"] == "O" && game_board["row_3_col_2"] == "O" && game_board["row_3_col_3"] == ""

    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_2_col_1"] == "O" && game_board["row_3_col_1"] == "O"
    return "row_2_col_1" if game_board["row_1_col_1"] == "O" && game_board["row_2_col_1"] == "" && game_board["row_3_col_1"] == "O"
    return "row_3_col_1" if game_board["row_1_col_1"] == "O" && game_board["row_2_col_1"] == "O" && game_board["row_3_col_1"] == ""

    return "row_1_col_2" if game_board["row_1_col_2"] == "" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_2"] == "O"
    return "row_2_col_2" if game_board["row_1_col_2"] == "O" && game_board["row_2_col_2"] == "" && game_board["row_3_col_2"] == "O"
    return "row_3_col_2" if game_board["row_1_col_2"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_2"] == ""

    return "row_1_col_3" if game_board["row_1_col_3"] == "" && game_board["row_2_col_3"] == "O" && game_board["row_3_col_3"] == "O"
    return "row_2_col_3" if game_board["row_1_col_3"] == "O" && game_board["row_2_col_3"] == "" && game_board["row_3_col_3"] == "O"
    return "row_3_col_3" if game_board["row_1_col_3"] == "O" && game_board["row_2_col_3"] == "O" && game_board["row_3_col_3"] == ""

    return "row_1_col_1" if game_board["row_1_col_1"] == "" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_3"] == "O"
    return "row_2_col_2" if game_board["row_1_col_1"] == "O" && game_board["row_2_col_2"] == "" && game_board["row_3_col_3"] == "O"
    return "row_3_col_3" if game_board["row_1_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_3"] == ""

    return "row_3_col_1" if game_board["row_3_col_1"] == "" && game_board["row_2_col_2"] == "O" && game_board["row_1_col_3"] == "O"
    return "row_2_col_2" if game_board["row_3_col_1"] == "O" && game_board["row_2_col_2"] == "" && game_board["row_1_col_3"] == "O"
    return "row_1_col_3" if game_board["row_3_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_1_col_3"] == ""
  end

  def pick_move
    available_moves = game_board.select { |key, value| value  == "" }.keys.to_a

    available_moves.sample(1)[0]
  end

end
