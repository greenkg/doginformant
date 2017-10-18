class Dog < ApplicationRecord

  validates :breed, :breed_group, presence: true

  before_validation :generate_slug, :generate_size

  BREED_GROUPS = [
    "Sporting Group",
    "Hound Group",
    "Working Group",
    "Terrier Group",
    "Toy Group",
    "Herding Group",
    "Non-Sporting Group",
    "Miscellaneous Class",
    "Foundation Stock Service Program",
    "Non-AKC Designer Dog"
  ]

  scope :by_energy, -> (values) { where energy_level: values }
  scope :by_kids, -> (values) { where kid_friendly: values }

  def generate_slug
    self.slug ||= breed.parameterize if breed
  end

  def to_param
    slug
  end

  def generate_size
    self.dog_size ||= "small" if height_min < 15
    self.dog_size ||= "medium" if height_min >= 15 && height_min <= 18
    self.dog_size ||= "large" if height_min > 18
  end

  def self.filter(params)
    #create an anonymous scope
    results = Dog.all

    #filter by energy level
    results = results.by_energy(tidy_up(params[:energy])) if params[:energy].present?
    #filter by friendliness towards children
    results = results.by_kids(tidy_up(params[:kids])) if params[:kids].present?
  
    return results
  end

  def self.tidy_up(values)
    tidied_values = values.each_char.map(&:to_i)
  end
  
end
