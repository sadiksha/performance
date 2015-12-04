require 'spec_helper'
require 'capybara/rspec'

feature "Product" do
  scenario "can be created from new page" do
    visit products_path
    click_link "New"

    fill_in "Name", with: "Product"
    fill_in "Description", with: "This is a new product"
    fill_in "Price", with: "12.33"
    click_button "Create Product"

    expect(Product.count).to eq(1)

    product = Product.first
    expect(product.name).to eq("Product")
    expect(product.description).to eq("This is a new product")
    expect(product.price).to eq(12.33)
  end

  scenario "can be viewed in the index page" do
    create(:product)
    visit products_path
    expect(page).to have_content("Product")
    expect(page).to have_content("This is my precious")
    expect(page).to have_content("9.99")
  end

  scenario "can edit products" do
    create(:product)
    visit products_path

    click_link "Edit"

    expect(page).to have_field("Name", with: "Product")
    expect(page).to have_field("Description", with: "This is my precious")
    expect(page).to have_field("Price", with: "9.99")

    fill_in "Name", with: "New name"
    click_button "Update Product"

    product = Product.first
    expect(product.name).to eq("New name")
    expect(page).to have_content("New name")
  end
end
