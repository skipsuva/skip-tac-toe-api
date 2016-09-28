class CheckBoard

  attr_reader :game, :game_board

  BOARD_CHECK_METHODS = [:check_top_row, :check_middle_row, :check_last_row, :check_first_column, :check_second_column, :check_third_column, :check_first_diag, :check_second_diag, :check_stalemate]

  def initialize(game_id)
    @game = Game.find(game_id)
    @game_board = game.game_data
  end

  def execute
    BOARD_CHECK_METHODS.each { |method| self.send(method) }
  end


  private

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
