class Product < ApplicationRecord
  belongs_to :icra, optional: true

  validates :name, presence: true
  validates :description, presence: true
end
