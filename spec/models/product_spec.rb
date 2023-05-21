require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    before(:each) do
      @category = Category.new
      @product = @category.products.new(
        name: 'Example Product',
        price_cents: 1000,
        quantity: 5
      )
    end

    it 'should save successfully when all fields are set' do
      expect(@product.save).to be true
    end

    it 'should have a name' do
      @product.name = nil
      @product.save
      expect(@product.errors.full_messages).to include("Name can't be blank")
    end

    it 'should have a price' do
      @product.price_cents = nil
      @product.save
      expect(@product.errors.full_messages).to include("Price can't be blank")
    end

    it 'should have a quantity' do
      @product.quantity = nil
      @product.save
      expect(@product.errors.full_messages).to include("Quantity can't be blank")
    end

    it 'should have a category' do
      @product.category = nil
      @product.save
      expect(@product.errors.full_messages).to include("Category can't be blank")
    end
  end
end
