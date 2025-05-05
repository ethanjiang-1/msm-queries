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

  def youngest
    @youngest = Director.where.not({ :dob => nil}).order(:dob).last
    @youngest_id = @youngest.id

    render({ :template => "director_templates/youngest" })
  end

  def oldest
    @oldest = Director.where.not({ :dob => nil}).order(:dob).first
    @oldest_id = @oldest.id

    render({ :template => "director_templates/eldest" })
  end
end
