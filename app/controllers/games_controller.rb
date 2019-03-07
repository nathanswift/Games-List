class GamesController < ApplicationController
  before_action :set_game, except: [:index, :create, :form]
 
  def index
    @games = Game.all
  end
 
  def show
  end

  def form
    @game = Game.new
    render partial: 'form'
  end
 
  def create
    @game = Game.new(game_params)
    if @game.save
      render json: @game
    else
      render_error(@game)
    end
  end
 
  def update
    if @game.update(game_params)
      render json: @game
    else
      render_error(@game)
    end
  end
 
  def destroy
    @game.destroy
    render json: { message: 'Removed' }, status: :ok
  end
 
  private
    def set_game
      @game = Game.find(params[:id])
    end
 
    def game_params
      params.require(:game).permit(:name, :description)
    end
 end