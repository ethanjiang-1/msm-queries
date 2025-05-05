class ActorsController < ApplicationController
  def index
    render({ :template => "actor_templates/list" })
  end

  def show
    @act_id = params.fetch("id")
    @act = Actor.where({ :id => @act_id }).at(0)

    if @act_id == nil
      redirect_to("/404")
    else
      render({ :template => "actor_templates/details" })
    end
  end
end
