class DogsController < ApplicationController

  def index
    @dogs = Dog.where(nil)
    @dogs = @dogs.dog_size(params[:size]) if params[:size].present?
    @dogs = @dogs.energy(params[:energy]) if params[:energy].present?
  end

  def show
    @dog = Dog.find_by!(slug: params[:id])
  end

end
