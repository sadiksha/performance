require 'spec_helper'
require 'capybara/rspec'

feature "Category" do
  scenario "can be viewed in index page" do
    create(:category)
    visit categories_path

    expect(page).to have_content "Category"
  end

  scenario "can be created" do
    visit categories_path
    click_link "New"

    fill_in "Name", with: "New Category"
    click_button "Create Category"
    expect(Category.count).to eq(1)

    category = Category.first
    expect(category.name).to eq("New Category")
  end
end
