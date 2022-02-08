require 'rails_helper'
# require "../../app/models/product.rb"
# require "../../app/models/category.rb"

RSpec.describe Product, type: :model do
  describe 'Validations' do

    # validation tests/examples here
    describe 'Initialize' do
      it "creates a new product in category 1" do
        cat1 = Category.create(name: 'Apparel')
        product1 = Product.create(
          name:  'Men\'s Cargo pants',
          description: Faker::Hipster.paragraph(4),
          image: 'apparel3.jpg',
          quantity: 18,
          price: 55.00,
          category: cat1
        )
        p product1
        expect(product1).to be_valid
      end
    end

    describe 'Name' do
      it "makes sure name isn't blank" do
        cat1 = Category.create(name: 'Apparel')
        product1 = Product.create(
          description: Faker::Hipster.paragraph(4),
          image: 'apparel3.jpg',
          quantity: 18,
          price: 55.00,
          category: cat1
        )
        p product1.errors.full_messages
        expect(product1.errors.full_messages).to include("Name can't be blank")
      end
    end

    describe 'Price' do
      it "makes sure price isn't blank" do
        cat1 = Category.create(name: 'Apparel')
        product1 = Product.create(
          name:  'Men\'s Cargo pants',
          description: Faker::Hipster.paragraph(4),
          image: 'apparel3.jpg',
          quantity: 18,
          category: cat1
        )
        p product1.errors.full_messages
        expect(product1.errors.full_messages).to include("Price cents is not a number")
      end
    end

    describe 'Quantity' do
      it "makes sure quantity isn't blank" do
        cat1 = Category.create(name: 'Apparel')
        product1 = Product.create(
          name:  'Men\'s Cargo pants',
          description: Faker::Hipster.paragraph(4),
          image: 'apparel3.jpg',
          price: 55.00,
          category: cat1
        )
        p product1.errors.full_messages
        expect(product1.errors.full_messages).to include("Quantity can't be blank")
      end
    end

    describe 'Category' do
      it "makes sure category isn't blank" do
        cat1 = Category.create(name: 'Apparel')
        product1 = Product.create(
          name:  'Men\'s Cargo pants',
          description: Faker::Hipster.paragraph(4),
          image: 'apparel3.jpg',
          quantity: 18,
          price: 55.00,
        )
        p product1.errors.full_messages
        expect(product1.errors.full_messages).to include("Category can't be blank")
      end
    end


  end
end
