class Icra < ApplicationRecord
  belongs_to :deal, optional: true
  has_many :products
  accepts_nested_attributes_for :products, allow_destroy: true
end
