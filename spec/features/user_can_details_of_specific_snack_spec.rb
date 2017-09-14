require 'rails_helper'

feature "When a user visits a snack show page" do
  scenario "they see the name, price, locations, average price, count of items in machine" do
    sam = Owner.create(name: "Sam's Snacks")
    machine1 = sam.machines.create(location: "Don's Mixed Drinks")
    machine2 = sam.machines.create(location: "Turing Basement")


    snack1 = Snack.create(name: "White Castle Burger", price: 3.50)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.50)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)

    machine1.snacks = [snack1, snack2]
    machine2.snacks = [snack1, snack3]

    visit snack_path(snack1)

    expect(page).to have_content("#{snack1.name}")
    expect(page).to have_content("Price: #{snack1.price}")
    expect(page).to have_content(machine1.location)
    expect(page).to have_content(machine2.location)
    expect(page).to have_content(machine1.count_of_snacks)
    expect(page).to have_content(machine1.average_price)
    expect(page).to have_content(machine2.count_of_snacks)
    expect(page).to have_content(machine2.average_price)
  end
end
