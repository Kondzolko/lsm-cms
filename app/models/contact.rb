class Contact < ApplicationRecord
  belongs_to :coverholder, optional: true
end
