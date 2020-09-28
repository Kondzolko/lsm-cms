class ParticipatingUnderwriter < ApplicationRecord
  belongs_to :underwriter, optional: true
  belongs_to :deal, optional: true
end
