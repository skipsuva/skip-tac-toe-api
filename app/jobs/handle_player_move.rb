class HandlePlayerMove

  attr_accessor :game, :game_board, :player_move_position

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
    CheckBoard.new(game.id).execute
  end

  def record_computer_move
    HandleComputerMove.new(game.id).execute
  end
end
