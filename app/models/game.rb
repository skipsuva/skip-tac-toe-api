class Game < ActiveRecord::Base

  def self.default_game_data
    {
      row_1_col_1: "",
      row_1_col_2: "",
      row_1_col_3: "",
      row_2_col_1: "",
      row_2_col_2: "",
      row_2_col_3: "",
      row_3_col_1: "",
      row_3_col_2: "",
      row_3_col_3: ""
    }
  end

  def player_won!
    update!(player_won: true)
  end

  def computer_won!
    update!(player_won: false)
  end
end
