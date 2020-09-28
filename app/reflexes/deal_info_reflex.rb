class DealInfoReflex < ApplicationReflex
  before_reflex do
    @deal_info = GlobalID::Locator.locate_signed(element.dataset.signed_id)
    @deal_info.assign_attributes(deal_info_params)
  end

  def submit
    @deal_info.save
  end

  private

  def deal_info_params
    params.require(:deal_info).permit!
  end
end