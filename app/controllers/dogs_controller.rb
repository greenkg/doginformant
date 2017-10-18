class DogsController < ApplicationController

  def index
    @dogs = Dog.filter(params.slice(:energy, :kids))
    @filter_input = (params.slice(:energy, :kids))
  end

  def show
    @dog = Dog.find_by!(slug: params[:id])
  end

end
