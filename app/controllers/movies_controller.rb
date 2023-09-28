class MoviesController < ApplicationController
  def index
    render({ :template => "movies_templates/list"})
  end

  def show
  end
end
