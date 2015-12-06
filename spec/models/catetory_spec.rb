require "spec_helper"

describe Category, "status", type: :model do
  it "has attribute name" do
    category = Category.new(name: "category")
    expect(category).to have_attributes(name: "category")
  end
end
