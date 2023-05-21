require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    it 'should have a name' do
      @category = Category.new
      @product = @category.products.new(name: "Green tea")
      expect(@product.name).to eq("Green tea")
    end
  end
end
