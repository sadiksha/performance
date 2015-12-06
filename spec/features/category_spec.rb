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

  scenario "can be edited" do
    create(:category)
    visit categories_path
    click_link "Edit"

    fill_in "Name", with: "Edited Category"
    click_button "Update Category"

    category = Category.first
    expect(category.name).to eq("Edited Category")

    expect(page).to have_content("Edited Category")
  end

  scenario "can be destroyed", js: true do
    create(:category)
    visit categories_path
    click_link "Delete"

    page.driver.browser.switch_to.alert.accept

    sleep 1
    expect(Category.count).to eq(0)
  end
end
