# As a user
# When I visit a specific vending machine page
#
# I see the name of all of the snacks associated
#  with that vending machine along with their price

require 'rails_helper'

feature "When a user visits the vending machine show page" do
  scenario "they see names of all the snacks in machine and their prices" do
    sam = Owner.create(name: "Sam's Snacks")
    snack1 = Snack.create(name: "White Castle Burger", price: 3.50)
    snack2 = Snack.create(name: "Pop Rocks", price: 1.50)
    snack3 = Snack.create(name: "Flaming Hot Cheetos", price: 2.50)
    machine = sam.machines.create(location: "Don's Mixed Drinks")
    machine.snacks = [snack1, snack2, snack3]

    visit machine_path(machine)
    save_and_open_page

    expect(page).to have_content(snack1.name)
    expect(page).to have_content(snack2.name)
    expect(page).to have_content(snack3.name)
    expect(page).to have_content(snack1.price)
    expect(page).to have_content(snack2.price)
    expect(page).to have_content(snack3.price)
    binding.pry
    expect(page).to have_content(machine.average_price)
  end
end
