class DirectorsController < ApplicationController
  def index
    render({ :template => "director_templates/list"})
  end

  def youngest
    render({ :template => "director_templates/youngest"})
  end

  def eldest
    sorted_director = Director.all.order(:dob => :desc ).where.not(dob: nil)

    @director_old = sorted_director.last

    @director_bday = @director_old.dob.strftime("%B %w, %Y")

    render({ :template => "director_templates/eldest"})
  end

  def show
    the_id = params.fetch("the_id")

    matching_records = Director.where({ :id => the_id })

    @the_director = matching_records.at(0)

    render({ :template => "director_templates/details"})
  end

 
end
