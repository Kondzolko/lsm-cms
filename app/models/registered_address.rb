class RegisteredAddress < ApplicationRecord
  belongs_to :coverholder, optional: true

  validates :country, presence: true
end
