require 'rails_helper'

describe "Viewing the list of dogs" do

  it "shows the dogs" do

    visit 'http://example.com/dogs'

    expect(page).to have_text("3 Dogs")

  end
  
end