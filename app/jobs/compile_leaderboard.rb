class CompileLeaderboard

  attr_reader :games

  def initialize
    @games = Game.find_top_games
  end

  def execute
    compile_response
  end


  private

  def compile_response
    objects = games.map do |game|
      { name: Player.find(game.user_id).name, player_move_count: game.player_move_count }
    end

    objects
  end

end
