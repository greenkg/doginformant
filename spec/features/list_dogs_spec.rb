require 'rails_helper'

describe "Viewing the list of dogs" do

  it "shows the dogs" do

  dog1 = Dog.create(
    breed: "Pomeranian",
    breed_group: "Toy Group",
    breed_summary: "Animated, extroverted and alert.",
    image_file_name: "http://d45j0koqy9g2z.cloudfront.net/breed-pomeranian.jpg",
    height_min: 6,
    height_max: 7,
    weight_min: 3,
    weight_max: 7,
    dog_size: "Tiny",
    life_min: 12,
    life_max: 16,
    affectionate: 5,
    kid_friendly: 2,
    stranger_friendly: 3,
    trainability: 4,
    energy_level: 3,
    shedding: true,
    popularity_rank: 22,
    history: ""
    )

  dog2 = Dog.create(
    breed: "Havanese",
    breed_group: "Toy Group",
    breed_summary: "Curious, social and happy.",
    image_file_name: "http://d45j0koqy9g2z.cloudfront.net/breed-havanese.jpg",
    height_min: 8,
    height_max: 12,
    weight_min: 7,
    weight_max: 13,
    dog_size: "Tiny and Small",
    life_min: 14,
    life_max: 16,
    affectionate: 5,
    kid_friendly: 4,
    stranger_friendly: 5,
    trainability: 5,
    energy_level: 3,
    shedding: false,
    popularity_rank: 23,
    history: ""
  )
  
  dog3= Dog.create(
    breed: "Shetland Sheepdog",
    breed_group: "Herding Group",
    breed_summary: "Intelligent, energetic and playful.",
    image_file_name: "http://d45j0koqy9g2z.cloudfront.net/breed-shetland-sheepdog.jpg",
    height_min: 13,
    height_max: 16,
    weight_min: 15,
    weight_max: 25,
    dog_size: "Small and Medium",
    life_min: 12,
    life_max: 14,
    affectionate: 5,
    kid_friendly: 5,
    stranger_friendly: 5,
    trainability: 5,
    energy_level: 4,
    shedding: true,
    popularity_rank: 24,
    history: ""
  )

    visit dogs_url

    expect(page).to have_text("3 Dogs")

  end
  
end