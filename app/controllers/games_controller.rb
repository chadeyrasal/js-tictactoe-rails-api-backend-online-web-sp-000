class GamesController < ApplicationController

  before_action :find_game, only: [:show, :update]
# We are not going to actually visit these routes but JS will reach out to these endpoints and get information back

  def create # POST /games
    @game = Game.create(game_params)
    render json: @game
  end

  def show # GET /games/:id
    render json: @game
  end

  def update # PATCH /games/:id
    @game.update(game_params)
    render json: @game
  end

  def index # GET /games
    @games = Game.all
    render json: @games
  end


  private

  def game_params
    params.permit(state: [])
  end

  def find_game
    @game = Game.find(params[:id])
  end

end
