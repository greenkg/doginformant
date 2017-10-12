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

  def generate_slug
    self.slug ||= breed.parameterize if breed
  end

  def to_param
    slug
  end
  
end
