module Uw
  module RegisteredAddresses
    class Save
      include Interactor

      def call
        if context.registered_address.save!
          context.prev_registered_address_attributes ||= context.registered_address.saved_changes.transform_values { |v| v[0] }
        else
          context.fail!(errors: context.registered_address.errors)
        end
      end

      def rollback
        context.registered_address.update(context.prev_registered_address_attributes)
        context.prev_registered_address_attributes = nil
      end
    end
  end
end