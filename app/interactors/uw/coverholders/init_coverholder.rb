module Uw
  module Coverholders
    class InitCoverholder
      include Interactor

      def call
        context.coverholder ||= Coverholder.new(context.attributes)
        if context.coverholder.errors.present? ||
            context.coverholder.legal_entity_name.blank?  # We can do more complex validations in Interactors
          context.coverholder.errors.add(:legal_entity_name, :blank)
          context.fail!
        end
      end
    end
  end
end