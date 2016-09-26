class Game < ActiveRecord::Base

  def self.default_game_data
    {
      row_one: {a: nil, b: nil, c: nil},
      row_two: {a: nil, b: nil, c: nil},
      row_three: {a: nil, b: nil, c: nil}
    }
  end
end
