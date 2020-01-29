class GenresController < ApplicationController
  def show
    @genre = Genre.find(params[:id])
    @filtered_items = @genre.item
  end
end
