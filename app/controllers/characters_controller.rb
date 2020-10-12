class CharactersController < ApplicationController
  def index
    @characters = Character.includes(:species, :homeworld).all.paginate(:page => params[:page], :per_page => 12)
  end

  def show
    @character = Character.find(params[:id])
  end
end
