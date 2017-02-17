require 'rails_helper'

RSpec.describe User do
  it "will have a username" do
    user = FactoryGirl.create(:user)
    expect(user.username).to eq 'user1'
  end
  it "will have an email" do
    user = FactoryGirl.create(:user)
    expect(user.email).to eq 'test@gmail.com'
  end
  it "will have a password" do
    user = FactoryGirl.create(:user)
    expect(user.password).to eq 'pass123'
  end
end
