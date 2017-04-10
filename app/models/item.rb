class Item < ApplicationRecord
  validates :name, presence: true
  validates :price, presence: true
  validates :sentimental, presence: true
  validates :description, presence: true
end
