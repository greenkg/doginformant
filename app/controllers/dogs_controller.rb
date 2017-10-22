class DogsController < ApplicationController

  before_action :require_admin, except: [:index, :show, :breed_matcher]

  def index
    if params[:search]
      @dogs = Dog.search(params[:search])
    else
      @dogs = Dog.all
    end
  end

  def show
    @dog = Dog.find_by!(slug: params[:id])
  end

  def breed_matcher
    @dogs = Dog.filter(params.slice(:energy, :kids, :size))
  end

  def new
    @dog = Dog.new
  end

  def create
    @dog = Dog.new(dog_params)
    if @dog.save
      redirect_to @dog, notice: "Dog successfully added!"
    else
      render :new
    end
  end

  def edit
    @dog = Dog.find_by(slug: params[:id])
  end

  def update
    @dog = Dog.find_by(slug: params[:id])
    if @dog.update(dog_params)
      flash[:notice] = "Dog successfully updated!"
      redirect_to @dog
    else
      render :edit
    end
  end

private

  def dog_params
    dog_params = params.require(:dog).permit(:breed, :breed_group, :breed_summary, :image_file_name, :height_min, :height_max, :weight_min, :weight_max, :life_min, :life_max, :affectionate, :kid_friendly, :stranger_friendly, :trainability, :energy_level, :shedding, :popularity_rank, :slug, :dog_size, :history)
  end

  def require_admin
    unless current_user_admin?
      redirect_to root_url, alert: "You do not have the authorization to access this feature."
    end
  end

  def current_user_admin?
    current_user && current_user.admin?
  end

  helper_method :current_user_admin?

end
