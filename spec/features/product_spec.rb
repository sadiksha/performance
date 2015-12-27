require 'spec_helper'
require 'capybara/rspec'

feature "Product" do
  scenario "can be created from new page" do
    category = create(:category)
    visit products_path
    click_link "New"

    select "Category", from: "Category"
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

  scenario "can be edited" do
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

  scenario "can be destroyed", js: true do
    create(:product)
    visit products_path

    click_link "Delete"
    page.driver.browser.switch_to.alert.accept
    sleep 1
    expect(Product.all.count).to eq(0)
  end

  scenario "gives error on empty price and name when creating new product" do
    category = create(:category)
    visit new_product_path

    select "Category", from: "Category"
    click_button "Create Product"
    expect(page).to have_content("Name can't be blank")
    expect(page).to have_content("Price can't be blank")
  end
end
