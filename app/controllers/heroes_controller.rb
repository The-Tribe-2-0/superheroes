class HeroesController < ApplicationController
    def index
      heroes = Hero.all
      render json: heroes
    end
  
    def show
      hero = Hero.find_by(id: params[:id])
      if hero
        render json: hero, include: :powers
      else
        render json: { error: 'Hero not found' }, status: :not_found
      end
    end
  end
  