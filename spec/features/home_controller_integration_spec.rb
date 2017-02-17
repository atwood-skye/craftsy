require 'rails_helper'

describe HomeController do
  it "will show no products when there aren't any" do
    visit '/'
    expect(page).to have_content 'Our Products'
  end
  it "will show all products" do
    user = FactoryGirl.create(:user)
    visit '/'
    click_on 'Sign In'
    fill_in "Email", :with => user.email
    fill_in "Password", :with => user.password
    click_on 'Log in'
    click_on 'Add Product'
    fill_in "Name", :with => "Painting"
    fill_in "Description", :with => "Beautiful"
    fill_in "Price", :with => 25
    click_on 'Submit'
    expect(page).to have_content 'Beautiful'
  end

end
