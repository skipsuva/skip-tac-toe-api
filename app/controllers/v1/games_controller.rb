class V1::GamesController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  # POST
  def create
    player = Player.create!(name: params[:player_initials])

    @game = Game.new(
      user_id: player.id,
      player_move_count: 0,
      game_data: Game.default_game_data
    )

    if @game.save

      @game.randomize_first_move
      @game.reload

      render json: @game, status: 201
    else
      render json: { errors: @game.errors }, status: 500
    end
  end

  # PATCH/PUT
  def reset
    @game = Game.find(params[:id])
<<<<<<< HEAD
    @game.reset!
=======

    if @game.update!(player_move_count: 0, game_data: Game.default_game_data, created_at: Time.now)

      @game.randomize_first_move
      @game.reload
>>>>>>> master

      render json: @game, status: 200
    else
      render json: { errors: @game.errors }, status: 500
    end
  end

  # PATCH/PUT
  def player_move
    player_move = params[:player_move]

    HandlePlayerMove.new(params[:id], player_move).execute

    @game = Game.find(params[:id])

    if @game
      render json: @game, status: 200
    else
      render json: { errors: @game.errors }, status: 500
    end
  end


end
