class Product < ActiveRecord::Base
  has_many :reviews
  has_many :users, through: :reviews
  validates :name, presence: :true
  validates :description, presence: :true
  validates :price, presence: :true
end
