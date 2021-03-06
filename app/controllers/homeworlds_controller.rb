class HomeworldsController < ApplicationController
  def index
    @homeworlds = Homeworld.all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @homeworlds = Homeworld.find(params[:id])
    @people = Character.where(homeworld_id: @homeworlds.id)
  end
end
