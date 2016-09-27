class HandlePlayerMove

  attr_reader :game, :player_move_position

  def initialize(game_id, player_move)
    @game = Game.find(game_id)
    @player_move_position = player_move
  end

  execute do
    record_player_move
    determine_next_event
  end


  private

  def record_player_move
    game.game_data[player_move_position] = "O"
    game.player_move_count ++
    game.save!
  end

  def determine_next_event
    game_status = check_game_board



  end

  def check_game_board
    game_board = game.game_data

    # loop through check methods?
  end




  def check_top_row
    if game_board[:row_1_col_1] == "O" && game_board[:row_1_col_2] == "O" && game_board[:row_1_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_1_col_1] == "X" && game_board[:row_1_col_2] == "X" && game_board[:row_1_col_3] == "X"
        game.computer_won!
    end
  end

  def check_middle_row
    if game_board[:row_2_col_1] == "O" && game_board[:row_2_col_2] == "O" && game_board[:row_2_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_2_col_1] == "X" && game_board[:row_2_col_2] == "X" && game_board[:row_2_col_3] == "X"
      game.computer_won!
    end
  end

  def check_middle_row
    if game_board[:row_3_col_1] == "O" && game_board[:row_3_col_2] == "O" && game_board[:row_3_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_3_col_1] == "X" && game_board[:row_3_col_2] == "X" && game_board[:row_3_col_3] == "X"
      game.computer_won!
    end
  end

  def check_first_column
    if game_board[:row_1_col_1] == "O" && game_board[:row_2_col_1] == "O" && game_board[:row_3_col_1] == "O"
      game.player_won!
    end
    if game_board[:row_1_col_1] == "X" && game_board[:row_2_col_1] == "X" && game_board[:row_3_col_1] == "X"
      game.computer_won!
    end
  end

  def check_second_column
    if game_board[:row_1_col_2] == "O" && game_board[:row_2_col_2] == "O" && game_board[:row_3_col_2] == "O"
      game.player_won!
    end
    if game_board[:row_1_col_2] == "X" && game_board[:row_2_col_2] == "X" && game_board[:row_3_col_2] == "X"
      game.computer_won!
    end
  end

  def check_third_column
    if game_board[:row_1_col_3] == "O" && game_board[:row_2_col_3] == "O" && game_board[:row_3_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_1_col_3] == "X" && game_board[:row_2_col_3] == "X" && game_board[:row_3_col_3] == "X"
      game.computer_won!
    end
  end

  def check_first_diag
    if game_board[:row_1_col_1] == "O" && game_board[:row_2_col_2] == "O" && game_board[:row_3_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_1_col_1] == "X" && game_board[:row_2_col_2] == "X" && game_board[:row_3_col_3] == "X"
      game.computer_won!
    end
  end

  def check_second_diag
    if game_board[:row_3_col_1] == "O" && game_board[:row_2_col_2] == "O" && game_board[:row_1_col_3] == "O"
      game.player_won!
    end
    if game_board[:row_3_col_1] == "X" && game_board[:row_2_col_2] == "X" && game_board[:row_1_col_3] == "X"
      game.computer_won!
    end
  end

  def check_draw
    if game_board.has_value?("") == false
      # mark stalemate
    end
  end

end
