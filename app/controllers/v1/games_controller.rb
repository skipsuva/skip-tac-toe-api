class V1::GamesController < ApplicationController

  # POST
  def create
    player = Player.create!(name: params[:player_name])

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
    @game = Game.find(params[:id])

    # send game to calculator object
    render json: @game
  end


end
