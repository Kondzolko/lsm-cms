module Uw
  module Deals
    class Save
      include Interactor

      def call
        unless context.deal.save
          context.fail
        end
      end
    end
  end
end