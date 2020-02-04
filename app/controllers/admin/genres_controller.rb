class Admin::GenresController < ApplicationController
  before_action :authenticate_admin_user!
  
  def index
    @genre = Genre.new
    @genres = Genre.all
  end

  def create
    @genre = Genre.new(genre_params)
    if @genre.save
      redirect_to admin_genres_path(@genres), notice: "You have creatad genre successfully."
    else
      @genres = Genre.all
      render action: :index
    end
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
    @genre = Genre.find(params[:id])
    if @genre.update(genre_params)
      redirect_to admin_genres_path, notice: "You have updated genre successfully."
    else
      render action: :edit
    end
  end

  private
  def genre_params
    params.require(:genre).permit(:name,:status)
  end

  def ensure_correct_user
    @genre = Genre.find_by(id: params[:id])
    if @genre.user_id != current_user.id
      redirect_to root_path
    end
  end
end
