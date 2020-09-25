module Uw
  module Coverholders
    module Organizers
      class UpdateCoverholder
        include Interactor::Organizer

        organize ::Uw::Coverholders::UpdateCoverholder,
                 ::Uw::Coverholders::SaveCoverholder
      end
    end
  end
end