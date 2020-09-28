class Underwriter::TradingLocationAddressPolicy
  attr_reader :underwriter, :resource

  def initialize(underwriter, resource)
    @underwriter = underwriter
    @resource    = resource
  end

  def permitted_attributes_for_create
    %i[country address_line_1 address_line_2 state city zip phone]
  end

  def permitted_attributes_for_update
    %i[country address_line_1 address_line_2 state city zip phone]
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def update?
    resource.coverholder.contracts.empty? # TODO: We need more complicated validation
  end

  def index?
    true
  end
end
