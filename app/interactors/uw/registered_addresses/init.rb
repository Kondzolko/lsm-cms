module Uw
  module RegisteredAddresses
    class Init
      include Interactor

      def call
        context.registered_address ||= RegisteredAddress.new(context.attributes)
        if context.registered_address.errors.present? ||
            context.registered_address.country.blank?  # We can do more complex validations in Interactors
          context.registered_address.errors.add(:country, :blank)
          context.fail!
        end
      end
    end
  end
end