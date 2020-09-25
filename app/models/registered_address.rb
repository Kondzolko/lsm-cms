class RegisteredAddress < ApplicationRecord
  belongs_to :coverholder, optional: true
end
