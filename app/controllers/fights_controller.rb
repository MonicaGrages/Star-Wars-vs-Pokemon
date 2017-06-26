class FightsController < ApplicationController
  def index
    @star_war = StarWar.generate rand(90)
    @pokemon = Pokemon.generate rand(719)
    @star_wars = StarWar.order(wins: :desc).limit(3)
  end
end
