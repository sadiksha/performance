require "spec_helper"

describe Category, "status", type: :model do
  it "has attribute name" do
    category = Category.new(name: "category")
    expect(category).to have_attributes(name: "category")
  end

  describe "validates presence of " do
    it "name" do
      category = build(:category, name: nil)
      category.save

      expect(category).to_not be_valid

      errors = category.errors.full_messages
      expect(errors.count).to eq(1)
      expect(errors.first).to eq("Name can't be blank")
    end
  end
end
