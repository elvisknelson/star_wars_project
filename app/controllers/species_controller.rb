class SpeciesController < ApplicationController
  def index
    @species = Species.all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @species = Species.find(params[:id])
    @people = Character.where(species_id: @species.id)
  end
end
