require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @category = Category.new
      @product = @category.products.new(name: "Green tea")
      expect(@product.name).to eq("Green tea")
    end
    it 'should have a price' do
      @category = Category.new
      @product = @category.products.new(price: Money.new(120))
      expect(@product.price).to eq(Money.new(120))
    end
    it 'should have a quantity' do
      @category = Category.new
      @product = @category.products.new(quantity: 4)
      expect(@product.quantity).to eq(4)
    end
    it 'should have a category' do
      @category = Category.new(name: "Trees")
      @product = @category.products.new
      expect(@product.category.name).to eq("Trees")
    end
  end
end
