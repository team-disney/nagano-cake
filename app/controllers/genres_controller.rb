class GenresController < ApplicationController
  def show
    # ONLY GENRE THIS PAGES
    @genre = Genre.find(params[:id])

    # ONLY FILTERED ITEMS BY GENRE
    @filtered_items = Item.where(genre_id: @genre)

    # ONLY ACTIVE-GENRES
    @active_genres = Genre.where(status: 1)
  end
end
