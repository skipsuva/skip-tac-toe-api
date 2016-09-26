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
end
