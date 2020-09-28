class TradingName < ApplicationRecord
  belongs_to :coverholder, optional: true
end
