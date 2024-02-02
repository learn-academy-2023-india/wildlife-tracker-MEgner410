class SightingsController < ApplicationControl
    before_action :set_sighting, only: [:show, :update, :destroy]

    def create 
    @sighting = Sighting.new(sighting.params)
    if @sighting.save
        render json:@sighting.errors, status: :unprocessable_entity
    end
end

def update
    if @sighting.update(sighting.params)
        render json: @sighting
    else 
      render json: @sighting.errors, status: :unprocessable_entity
    end
end

def destroy
    @sighting.destroy
    head :no_content
end

private

def set_sighting
    @sighting = Sighting.find(params[:id])
end

def sighting_params
    params.require(:sighting).permit(:animal_id, :latitude, :longitude, :date)
end

end
