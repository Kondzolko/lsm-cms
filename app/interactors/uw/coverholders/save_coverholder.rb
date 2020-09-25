module Uw
  module Coverholders
    class SaveCoverholder
      include Interactor

      def call
        if context.coverholder.save
          context.prev_coverholder_attributes ||= context.coverholder.saved_changes.transform_values { |v| v[0] }
        else
          context.fail!(errors: context.coverholder.errors)
        end
      end

      def rollback
        context.coverholder.update(context.prev_coverholder_attributes)
        context.prev_coverholder_attributes = nil
      end
    end
  end
end