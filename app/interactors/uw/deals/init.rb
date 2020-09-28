module Uw
  module Deals
    class Init
      include Interactor

      def call
        context.deal ||= Deal.new(context.attributes)
        context.deal.underwriter = context.underwriter
        context.deal.build_deal_info
      end
    end
  end
end