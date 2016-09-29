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

  def self.find_player_won_games
    self.where(player_won: true)
  end

  def make_player_move!(player_move_position)
    self.game_data[player_move_position] = "O"
    self.player_move_count += 1
    self.save!
  end

  def make_computer_move!(computer_move_position)
    self.game_data[computer_move_position] = "X"
    self.save!
  end

  def player_won!
    self.update!(player_won: true, is_stalemate: false, completed_at: Time.now)
  end

  def computer_won!
    self.update!(player_won: false, is_stalemate: false, completed_at: Time.now)
  end

  def is_stalemate!
    self.update!(is_stalemate: true, completed_at: Time.now) if player_won == nil
  end

  def is_complete?
    self.player_won != nil || self.is_stalemate != nil
  end

  def completed_time
    return if !self.completed_at
    seconds_to_complete = self.completed_at - self.created_at

    Time.at(seconds_to_complete).utc.strftime("%M:%S")
  end
end
