class Underwriter::DealPolicy
  attr_reader :underwriter, :resource

  def initialize(underwriter, resource)
    @underwriter = underwriter
    @resource    = resource
  end

  def permitted_attributes_for_create
    %i[coverholder_id]
  end

  def create?
    true
  end

  def overview?
    true
  end

  def general_info?
    true
  end

  def icra?
    true
  end

  def contract_details?
    true
  end
end
