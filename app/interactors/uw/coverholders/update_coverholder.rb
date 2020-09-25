module Uw
  module Coverholders
    class UpdateCoverholder
      include Interactor

      def call
        context.coverholder.attributes = context.attributes
        if context.coverholder.errors.present? ||
            context.coverholder.legal_entity_name.blank? # We can do more complex validations in Interactors
          context.coverholder.errors.add(:legal_entity_name, :blank)
          context.fail!
        end
      end
    end
  end
end