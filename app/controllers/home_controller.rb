class HomeController < ApplicationController

  def index
    @dog = Dog.find_by(breed: "Chihuahua")
  end

end