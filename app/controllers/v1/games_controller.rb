class V1::GamesController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  # POST
  def create
    player = Player.create!(name: params[:player_initials])

    @game = Game.create!(
      user_id: player.id,
      player_move_count: 0,
      game_data: Game.default_game_data
    )

    render json: @game
  end

  # PATCH/PUT
  def reset
    @game = Game.find(params[:id])

    @game.update!(
      player_move_count: 0,
      game_data: Game.default_game_data
    )

    render json: @game
  end

  # PATCH/PUT
  def player_move
    player_move = params[:player_move]

    HandlePlayerMove.new(params[:id], player_move).execute

    @game = Game.find(params[:id])
    render json: @game
  end


end
