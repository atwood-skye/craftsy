require 'rails_helper'

describe HomeController do
  it "will show no products when there aren't any" do
    visit '/'
    expect(page).to have_content 'Our Products'
  end

end
