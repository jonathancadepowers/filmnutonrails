# frozen_string_literal: true

class FilmsController < ApplicationController
  def create
    @film = Film.new(film_params)
    if @film.save == true
      flash[:notice] = "New film added."
      redirect_to films_path
    else
      render action: "new"
    end
  end

  def destroy
    @film = Film.find(params[:id])
    @test = @film.destroy
    if @film.destroyed? == true
      flash[:notice] = "\"#{@film.title}\" was deleted!"
    else
      flash[:error] = "An error occured while
        attempting to delete \"#{@film.title}\"."
    end
    redirect_to films_path
  end

  def edit
    @film = Film.find(params[:id])
  end

  def index
    @all_films = Film.all.order("watched_on DESC")
  end

  def new
    @film = Film.new
  end

  def update
    @film = Film.find(params[:id])
    if @film.update(film_params) == true
      flash[:notice] = "\"#{@film.title}\" was updated."
      redirect_to films_path
    else
      render action: "edit"
    end
  end

  private

  def film_params
    params.require(:film).permit(
      :title,
      :url,
      :rating,
      :watched_on,
      :directors,
      :release_year,
      :running_time
    )
  end
end
