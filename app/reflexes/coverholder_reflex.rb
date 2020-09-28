class CoverholderReflex < ApplicationReflex
  before_reflex do
    @coverholder = GlobalID::Locator.locate_signed(element.dataset.signed_id)
  end

  def edit
  end

  def submit
    @coverholder.assign_attributes(permitted_params)
    @coverholder = nil if @coverholder.save
  end

  private

  def permitted_params
    params.require(:coverholder).permit(:legal_entity_name)
  end
end