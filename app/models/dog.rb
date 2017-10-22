class Dog < ApplicationRecord

  validates :breed, :breed_group, presence: true

  before_validation :generate_slug

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

  DOG_SIZES = [
    "All",
    "Tiny",
    "Tiny and Small",
    "Small",
    "Tiny, Small and Medium",
    "Small and Medium",
    "Medium",
    "Medium and Large",
    "Large",
    "Very Large"
  ]

  RANK = [
    1,
    2,
    3,
    4,
    5
  ]

  scope :by_energy, -> (values) { where energy_level: values }
  scope :by_kids, -> (values) { where kid_friendly: values }
  scope :by_size, -> (values) { where dog_size: values }

  def generate_slug
    self.slug ||= breed.parameterize if breed
  end

  def to_param
    slug
  end

  def self.filter(params)
    #start with all dogs
    results = Dog.all
    #filter by energy level
    results = results.by_energy(tidy_up(params[:energy])) if params[:energy].present?
    #filter by friendliness towards children
    results = results.by_kids(tidy_up(params[:kids])) if params[:kids].present?
    #filter by size
    results = results.by_size(size_inputs(params[:size])) if params[:size].present?
  
    return results
  end

  def self.size_inputs(search_term)
    case search_term
    when "all"
      values = ["Tiny", "Tiny and Small", "Small", "Tiny, Small and Medium", "Small and Medium", "Medium", "Medium and Large", "Large", "Very Large"]
    when "tiny"
      values = ["Tiny", "Tiny and Small", "Tiny, Small and Medium"]
    when "small"
      values = ["Tiny and Small", "Small", "Tiny, Small and Medium", "Small and Medium"]
    when "medium"
      values = ["Tiny, Small and Medium", "Small and Medium", "Medium", "Medium and Large"]
    when "large"
      values = ["Medium and Large", "Large"]
    when "very large"
      values = ["Very Large"]
    end
  end

  def self.tidy_up(values)
    #convert form values to integer array
    tidied_values = values.each_char.map(&:to_i)
  end

  def self.search(search_term)
    #filter main page results by breed search form
    Dog.where('lower(breed) LIKE ?', "%#{search_term.downcase}%") if search_term
  end

end
