require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'passes validation' do
      category = Category.new(name: "test");
      product = Product.new(name: "test", price: 2, quantity: 2, category: category)
      expect(product).to be_valid
    end
    it 'requires a name' do
      category = Category.new(name: "test");
      product = Product.new(name: nil, price: 2, quantity: 2, category: category)
      expect(product).not_to be_valid
      expect(product.errors[:name]).to include("can't be blank")
    end
    it 'requires a price' do
      category = Category.new(name: "test");
      product = Product.new(name: "Product", quantity: 2, category: category)
      expect(product).not_to be_valid
      expect(product.errors[:price]).to include("can't be blank")
    end
    it 'requires a quantity' do
      category = Category.new(name: "test");
      product = Product.new(name: "Product", price: 2, quantity: nil, category: category)
      expect(product).not_to be_valid
      expect(product.errors[:quantity]).to include("can't be blank")
    end
    it 'requires a category' do
      category = Category.new(name: "test");
      product = Product.new(name: "Product", price: 2, quantity: 2, category: nil)
      expect(product).not_to be_valid
      expect(product.errors[:category]).to include("can't be blank")
    end
  end
end
