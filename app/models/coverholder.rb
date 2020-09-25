class Coverholder < ApplicationRecord
  has_many :registered_addresses
  has_many :trading_location_addresses

  def contracts
    []
  end
end
