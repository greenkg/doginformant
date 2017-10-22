class HomeController < ApplicationController

  def index
    @dog = Dog.find_by(breed: "Shiba Inu")
  end

end