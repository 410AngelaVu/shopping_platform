require 'rails_helper'

RSpec.describe Product, type: :model do
  current_user = User.first_or_create!(email: 'deja@example.com', name: 'deja', password: 'password',
                                       password_confirmation: 'password')
  it 'has a name' do
    product = Product.new(
      name: '',
      description: 'A valid description',
      supplier: current_user,
      quantity: 2
    )
    expect(product).to_not be_valid
    product.name = 'A valid name'
    expect(product).to be_valid
  end

  it 'has a description' do
    product = Product.new(
      name: 'A valid name',
      description: '',
      supplier: current_user,
      quantity: 2
    )
    expect(product).to_not be_valid
    product.description = 'A valid description'
    expect(product).to be_valid
  end

  it 'has a name at least 2 chars long' do
    product = Product.new(
      name: '',
      description: 'A valid description',
      supplier: current_user,
      quantity: 2
    )
    expect(product).to_not be_valid
    product.name = 'ab'
    expect(product).to be_valid
  end

  it 'has a description between 2 and 5000 chars long' do
    product = Product.new(
      name: 'A valid name',
      description: '',
      supplier: current_user,
      quantity: 2
    )
    expect(product).to_not be_valid
    product.description = 'ab'
    expect(product).to be_valid
  end
end
