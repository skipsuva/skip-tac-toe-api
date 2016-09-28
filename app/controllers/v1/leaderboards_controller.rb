class V1::LeaderboardsController < ApplicationController
  ActionController::Parameters.permit_all_parameters = true

  # GET
  def index
    @games = CompileLeaderboard.new().execute

    render json: @games
  end

end
