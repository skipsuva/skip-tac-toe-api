class V1::LeaderboardsController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  # GET
  def index
    @games = CompileLeaderboard.new().execute
    if @games
      render json: @games, status: 200
    else
      render json: { errors: @games.errors }, status: 500
    end
  end

end
