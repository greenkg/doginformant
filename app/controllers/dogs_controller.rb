class DogsController < ApplicationController

  def index

    input = params[:size]

    case input
    when "small"
      @dogs = Dog.where("height_min < '15'")
    when "large"
      @dogs = Dog.where("height_max > '18'")
    else
      @dogs = Dog.all
    end

  end

  def show
    @dog = Dog.find_by!(slug: params[:id])
  end

end
