require "spec_helper"

describe Product, "status", type: :model do
  it "has attributes name, description and price" do
    product = Product.new(name: "product", description: "This is a product", price: 12.33)
    expect(product).to have_attributes(name: "product")
    expect(product).to have_attributes(description: "This is a product")
    expect(product).to have_attributes(price: 12.33)
  end
end
