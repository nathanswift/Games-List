class CharactersController < ApplicationController
  before_action :set_game
  before_action :set_character, except: [:index, :create]
 
  def index
    render json: @game.characters
  end
 
  def show
    render json: @character
  end
 
  def create
    @character = @game.characters.new(character_params)
 
    if @character.save
      render json: @character
    else
      render_error(@character)
    end
  end
 
  def update
    if @character.update(character_params)
      render json: @character
    else
      render_error(@character)
    end
  end
 
  def destroy
    @character.destroy
    render json: { message: 'Removed' }, status: :ok
  end
 
  private
    def set_game
      @game = Game.find(params[:game_id])
    end
 
    def set_character
      @character = Character.find(params[:id])
    end
 
    def character_params
      params.require(:character).permit(:name, :power)
    end
 end