class Underwriter::CoverholderPolicy
  attr_reader :underwriter, :resource

  def initialize(underwriter, resource)
    @underwriter = underwriter
    @resource    = resource
  end

  def permitted_attributes_for_create
    %i[legal_entity_name]
  end

  def permitted_attributes_for_update
    %i[legal_entity_name]
  end

  def create?
    true
  end

  def new?
    create?
  end

  def update?
    resource.contracts.empty? # TODO: We need more complicated validation
  end

  def edit?
    update?
  end
end
