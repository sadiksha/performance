require 'spec_helper'
require 'capybara/rspec'

feature "Category" do
  scenario "can be viewed in index page" do
    create(:category)
    visit categories_path

    expect(page).to have_content "Category"
  end
end
