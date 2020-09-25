class Underwriter::RegisteredAddressPolicy
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
    resource.coverholder.registered_addresses.count == 0
  end

  def new?
    create?
  end

  def update?
    resource.coverholder.contracts.empty? # TODO: We need more complicated validation
  end

  def edit?
    update?
  end
end
