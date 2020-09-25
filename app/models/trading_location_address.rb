class TradingLocationAddress < ApplicationRecord
  belongs_to :coverholder, optional: true
end
