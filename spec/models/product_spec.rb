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
  end
end
