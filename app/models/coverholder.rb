class Coverholder < ApplicationRecord
  has_one :registered_address, dependent: :destroy
  has_many :trading_location_addresses, dependent: :destroy
  has_many :contacts, dependent: :destroy
  has_many :underwriting_contacts, dependent: :destroy
  has_many :compliance_contacts, dependent: :destroy

  has_many :deals
  has_many :trading_names, dependent: :destroy

  validates :legal_entity_name, presence: true

  def contracts
    []
  end
end
