class StarshipsController < ApplicationController
  def index
    @starships = Starship.all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @starships = Starship.find(params[:id])
  end
end
