class CompileLeaderboard

  attr_reader :games

  def initialize
    @games = Game.find_player_won_games
  end

  def execute
    compile_response
  end


  private

  def compile_response
    filtered_games = sort_fastest_winners[0..14]

    objects = filtered_games.map do |game|
      { name: Player.find(game.user_id).name, player_win_time: game.completed_time }
    end

    objects
  end

  def sort_fastest_winners
    games.sort_by do |game|
      game.completed_time
    end
  end

end
