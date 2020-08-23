require 'rails_helper'

RSpec.describe "show a shelter's pets page", type: :feature do
  before :each do 
    @shelter_1 = Shelter.create!(
                                  name: "Rocky Mountain Puppy Rescue",
                                  address: "10021 E Iliff Ave",
                                  city: "Aurora",
                                  state: "CO",
                                  zip: "80247"
                                )
    
    @pet_1 = Pet.create!(
                          image: "http://3.bp.blogspot.com/-72agMABPgDw/Tx-76OX1SWI/AAAAAAAAAB4/OYmSC3j-4S8/s400/5.jpg",
                          name: "Fluffy",
                          approximate_age: "15 weeks",
                          sex: "Female",
                          shelter_id: @shelter_1.id,
                          description: "I am fluffy and so cute. I need someone to be my friend forever!!",
                          adoption_status: "Adoptable"
                        )

    @pet_2 = Pet.create!(
      image: "https://encrypted-tbn0.gstatic.com/images?q=tbn%3AANd9GcTYGQvgRUI5BJBhAUOKgogNviW22ZX0qECUnA&usqp=CAU",
      name: "Momo",
      approximate_age: "18 weeks",
      sex: "Female",
      shelter_id: @shelter_1.id,
      description: "Looking for my furever friend",
      adoption_status: "Pending"
    )
    
    visit "/pets/#{@pet_1.id}"
  end

  it "can see the pets's info" do
    expect(page).to have_css("img[src*='http://3.bp.blogspot.com/-72agMABPgDw/Tx-76OX1SWI/AAAAAAAAAB4/OYmSC3j-4S8/s400/5.jpg']")
    expect(page).to have_content(@pet_1.name)
    expect(page).to have_content(@pet_1.description)
    expect(page).to have_content(@pet_1.approximate_age)
    expect(page).to have_content(@pet_1.sex)
    expect(page).to have_content(@pet_1.adoption_status)
  end

  it "can link to form for updating its attributes" do
    expect(page).to have_link(href: "/pets/#{@pet_1.id}/edit")
  end

  it "can be deleted" do
    click_link "Delete Pet"

    expect(current_path).to eq("/pets")    
    expect(page).to_not have_content(@pet_1.name)
    # expectation above assumes that shelter names are unique
    expect(page).to_not have_link("Delete Pet") 
  end

  it "can change adoption status" do 
    expect(page).to have_have_link(href: "/pets/#{@pet_1.id}/pending")
    expect(page).to have_have_link(href: "/pets/#{@pet_1.id}/adoptable")
  end
end