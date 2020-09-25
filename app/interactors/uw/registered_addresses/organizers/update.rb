module Uw
  module RegisteredAddresses
    module Organizers
      class Update
        include Interactor::Organizer

        organize ::Uw::RegisteredAddresses::Update,
                 ::Uw::RegisteredAddresses::Save
      end
    end
  end
end