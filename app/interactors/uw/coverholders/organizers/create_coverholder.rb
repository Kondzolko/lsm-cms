module Uw
  module Coverholders
    module Organizers
      class CreateCoverholder
        include Interactor::Organizer

        organize ::Uw::Coverholders::InitCoverholder,
                 ::Uw::Coverholders::SaveCoverholder
      end
    end
  end
end