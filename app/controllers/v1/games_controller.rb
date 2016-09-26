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
    @game = Game.find(params[:id])

    @game.game_data[params[:player_move]] = "O"
    @game.save!

    # send game to calculator object
    render json: @game
  end


end
