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

  scope :dog_size, -> (size) { where dog_size: size }
  scope :energy, -> (energy) { where('energy_level = ? OR energy_level = ?', energy_array(energy)[0], energy_array(energy)[1]) }
 
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

  def self.energy_array(energy)
    case energy
    when "low"
      [1, 2]
    when "medium"
      [3, 3]
    when "high"
      [4, 5]
    end
  end
  
end
