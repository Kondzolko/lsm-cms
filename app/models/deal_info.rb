class DealInfo < ApplicationRecord
  belongs_to :deal, optional: true
end
