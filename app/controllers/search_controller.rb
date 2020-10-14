class SearchController < ApplicationController
  def index
    @search = params["search"]
    if @search.present?
      @name = @search["name"]
      @characters = Character.where("name LIKE ?", "%#{@name}%")
      @homeworlds = Homeworld.where("name LIKE ?", "%#{@name}%")
      @species = Species.where("name LIKE ?", "%#{@name}%")
    end
  end
end
