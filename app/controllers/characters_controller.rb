class CharactersController < ApplicationController
  before_action :set_character, only: %i[show edit update destroy]

  def index
    @character = Character.all
  end

  def show
  end

  def new
    def new
      @characters = Character.all
      @character = Character.new
    end
    
  end

  def edit
    @character = Character.find(params[:id])
  end
  

  def create
    @character = Character.new(character_params)

    if @character.save
      redirect_to @character, notice: 'Character was successfully created.'
    else
      render :new
    end
  end

  def update
    if @character.update(character_params)
      redirect_to @character, notice: 'Character was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @character.destroy
    redirect_to characters_url, notice: 'Character was successfully destroyed.'
  end

  private

  def set_character
    @character = Character.find(params[:id])
  end

  def character_params
    params.require(:character).permit(:nome, :raca, :classe, :atributos, :habilidades)
  end
end
