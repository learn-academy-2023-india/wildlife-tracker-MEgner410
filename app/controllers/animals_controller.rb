class AnimalsController < ApplicationController
    before_action :set_animal, only: [:show, :update, :destroy]

def index
    @animals = Animal.all 
    render json: @animals     
end

def create 
@animal = Animal.new(animal_params)
if @animal.save
    render json: @animal.errors, status: :unprocessable_entity
  end 
end

def update
    if @animal.update(animal_params)
        render json: @animal
    else 
      render json:@animal.errors, status: :unprocessable_entity
    end
end

def destroy
    @animal.destroy
    head :no_content
end

private

def set_animal
    @animal = Animal.find(params[:id])
end

def animal_params
    params.require(:animal).permit(:common_name, :scientific_binomial)
end
end



