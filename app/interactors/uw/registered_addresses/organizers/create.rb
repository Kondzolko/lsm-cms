module Uw
  module RegisteredAddresses
    module Organizers
      class Create
        include Interactor::Organizer

        organize ::Uw::RegisteredAddresses::Init,
                 ::Uw::RegisteredAddresses::Save
      end
    end
  end
end