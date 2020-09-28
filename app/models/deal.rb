class Deal < ApplicationRecord
  has_one :deal_info
  belongs_to :coverholder, optional: true
  belongs_to :underwriter, optional: true
  has_many :contacts
  has_many :participating_underwriters
  has_many :underwriters, through: :participating_underwriters

  enum lsm_platform_types: { lmie: 0, lmal: 1, lbs: 2, lmal_lbs: 3 }
end
