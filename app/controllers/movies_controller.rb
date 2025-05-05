class MoviesController < ApplicationController
  def index
    render({ :template => "movie_templates/list" })
  end

  def show
    @movie_id = params.fetch("id")
    @movie = Movie.where({ :id => @movie_id }).at(0)

    if @movie_id == nil
      redirect_to("/404")
    else
      render({ :template => "movie_templates/details" })
    end
  end
end
