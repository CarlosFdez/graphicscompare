class GamesController < ApplicationController
  def index
    @games = Game.all
  end

  def show
    @game = Game.find(params[:id])
    @left = @game.configurations[0]
    @right = @game.configurations[1]
  end
end
