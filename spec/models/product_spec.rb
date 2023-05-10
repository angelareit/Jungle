require 'rails_helper'

RSpec.describe Product, type: :model do
  describe 'Validations' do
    # validation tests/examples here
    
      it 'returns true if new product is saved in the db successfully' do
        a_category = Category.create(name: "Herbs") 
        a_product = Product.new(name: "Oregano", price: 123, quantity: 20, category: a_category)
        expect(a_product).to be_valid
      end

      it 'returns an error if product name doesnt exist' do
        a_category = Category.create(name: "Herbs") 
        a_product = Product.new(price: 123, quantity: 20, category: a_category)
        expect(a_product).to_not be_valid
        expect(a_product.errors.full_messages).to contain_exactly("Name can't be blank")
      end

      it 'returns an error if product price doesnt exist' do
        a_category = Category.create(name: "Herbs") 
        a_product = Product.new(name: "Basil", quantity: 20, category: a_category)
        expect(a_product).to_not be_valid
        expect(a_product.errors.full_messages).to include("Price can't be blank")
      end

      it 'returns an error if product quantity doesnt exist' do
        a_category = Category.create(name: "Herbs") 
        a_product = Product.new(name: "Rosemary", price:1223 , category: a_category)
        expect(a_product).to_not be_valid
        expect(a_product.errors.full_messages).to include("Quantity can't be blank")
      end
      
      it 'returns an error if product category doesnt exist' do
       
        a_product = Product.new(name: "Rosemary", price:1223 , quantity: 12)
        expect(a_product).to_not be_valid
        expect(a_product.errors.full_messages).to include("Category can't be blank")
      end

    end
end