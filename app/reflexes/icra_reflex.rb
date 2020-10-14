class IcraReflex < ApplicationReflex
  before_reflex do
    @icra = GlobalID::Locator.locate_signed(element.dataset.signed_id)
    @icra.assign_attributes(permitted_params)
  end

  def submit
    @icra.save
    puts "AHTUNG: #{@icra.errors.inspect}"
  end

  private

  def permitted_params
    params.require(:icra).permit!
  end
end