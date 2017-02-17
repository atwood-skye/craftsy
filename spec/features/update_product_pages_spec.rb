require 'rails_helper'

describe 'update a product' do
  it 'allows an admin to update a product' do
    user = FactoryGirl.create(:user)
    product = FactoryGirl.create(:product)
    visit product_path(product)
    click_link 'Edit Product'
    fill_in 'Name', :with => 'Cat Painting'
    click_button 'Submit'
    expect(page).to have_content 'Cat Painting'
  end
end
