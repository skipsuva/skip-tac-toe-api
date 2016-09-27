class HandlePlayerMove

  attr_accessor :game, :game_board, :player_move_position

  BOARD_CHECK_METHODS = [:check_top_row, :check_middle_row, :check_last_row, :check_first_column, :check_second_column, :check_third_column, :check_first_diag, :check_second_diag, :check_stalemate]

  def initialize(game_id, player_move)
    @game = Game.find(game_id)
    @game_board = game.game_data
    @player_move_position = player_move
  end

  def execute
    record_player_move
    check_game_board
    unless game.is_complete?
      record_computer_move
      check_game_board
    end
  end


  private

  def record_player_move
    game.make_player_move!(player_move_position)
  end

  def check_game_board
    BOARD_CHECK_METHODS.each { |method| self.send(method) }
  end

  def record_computer_move
    HandleComputerMove.new(game.id).execute
  end

  def check_top_row
    if game_board["row_1_col_1"] == "O" && game_board["row_1_col_2"] == "O" && game_board["row_1_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_1_col_1"] == "X" && game_board["row_1_col_2"] == "X" && game_board["row_1_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_middle_row
    if game_board["row_2_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_2_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_2_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_2_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_last_row
    if game_board["row_3_col_1"] == "O" && game_board["row_3_col_2"] == "O" && game_board["row_3_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_3_col_1"] == "X" && game_board["row_3_col_2"] == "X" && game_board["row_3_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_first_column
    if game_board["row_1_col_1"] == "O" && game_board["row_2_col_1"] == "O" && game_board["row_3_col_1"] == "O"
      game.player_won!
    end
    if game_board["row_1_col_1"] == "X" && game_board["row_2_col_1"] == "X" && game_board["row_3_col_1"] == "X"
      game.computer_won!
    end
  end

  def check_second_column
    if game_board["row_1_col_2"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_2"] == "O"
      game.player_won!
    end
    if game_board["row_1_col_2"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_2"] == "X"
      game.computer_won!
    end
  end

  def check_third_column
    if game_board["row_1_col_3"] == "O" && game_board["row_2_col_3"] == "O" && game_board["row_3_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_1_col_3"] == "X" && game_board["row_2_col_3"] == "X" && game_board["row_3_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_first_diag
    if game_board["row_1_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_3_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_1_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_3_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_second_diag
    if game_board["row_3_col_1"] == "O" && game_board["row_2_col_2"] == "O" && game_board["row_1_col_3"] == "O"
      game.player_won!
    end
    if game_board["row_3_col_1"] == "X" && game_board["row_2_col_2"] == "X" && game_board["row_1_col_3"] == "X"
      game.computer_won!
    end
  end

  def check_stalemate
    if game_board.has_value?("") == false
      game.is_stalemate!
    end
  end

end
