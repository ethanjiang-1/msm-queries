class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list" })
  end

  def show
    @dir_id = params.fetch("id")
    @dir = Director.where({ :id => @dir_id }).at(0)

    if @dir_id == nil
      redirect_to("/404")
    else
      render({ :template => "director_templates/details" })
    end
  end
end
