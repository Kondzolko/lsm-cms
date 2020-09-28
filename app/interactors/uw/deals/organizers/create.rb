module Uw
  module Deals
    module Organizers
      class Create
        include Interactor::Organizer

        organize ::Uw::Deals::Init,
                 ::Uw::Deals::Save
      end
    end
  end
end