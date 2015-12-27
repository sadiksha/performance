require "spec_helper"

describe Product, "status", type: :model do
  it "has attributes name, description and price" do
    product = Product.new(name: "product", description: "This is a product", price: 12.33)
    expect(product).to have_attributes(name: "product")
    expect(product).to have_attributes(description: "This is a product")
    expect(product).to have_attributes(price: 12.33)
  end

  describe "validates presence of " do
    it "name" do
      product = build(:product, price: 10, name: nil)
      product.save

      expect(product).to_not be_valid

      errors = product.errors.full_messages
      expect(errors.count).to eq(1)
      expect(errors.first).to eq("Name can't be blank")
    end

    it "price" do
      product = build(:product, price: nil, name: "Product")
      product.save

      expect(product).to_not be_valid

      errors = product.errors.full_messages
      expect(errors.count).to eq(1)
      expect(errors.first).to eq("Price can't be blank")
    end
  end
end
