require 'rails_helper'

RSpec.describe Product do
  it "will have a name" do
    product = FactoryGirl.create(:product)
    expect(product.name).to eq 'cat painting'
  end
  it "will have a description" do
    product = FactoryGirl.create(:product)
    expect(product.description).to eq 'so cute.'
  end
  it "will have a price" do
    product = FactoryGirl.create(:product)
    expect(product.price).to eq 25
  end
end
