class PowersController < ApplicationController
    skip_before_action :verify_authenticity_token
    def index
      powers = Power.all
      render json: powers
    end

    def show
      power = Power.find_by(id: params[:id])
      if power
        render json: power
      else
        render json: { error: 'Power not found' }, status: :not_found
      end
    end

    def update
        @power = Power.find(params[:id])
      
        if @power.update(power_params)
          render json: @power
        else
          render json: @power.errors, status: :unprocessable_entity
        end
      end
      

    private

    def power_params
        params.require(:power).permit(:description)
    end   
  end