class Admin::GenresController < ApplicationController

  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def edit
    @genre = Genre.find(params[:id])
    if @genre.user_id != current_user.id
      redirect_to root_path
    end
  end

  def create
    @genre = Genre.new(genre_params)
    @genre.user = current_user
    if @genre.save
      redirect_to genres_index_path(@genres), notice: "You have creatad genre successfully."
    else
      @genres = Genre.all
      render action: :index
    end
  end

  def update
    if @genre.update(genre_params)
      redirect_to genres_index_path(@genres), notice: "You have updated genre successfully."
    else
      render action: :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name)
  end

  def ensure_correct_user
    @genre = Genre.find_by(id: params[:id])
    if @genre.user_id != current_user.id
      redirect_to root_path
    end
  end
end
