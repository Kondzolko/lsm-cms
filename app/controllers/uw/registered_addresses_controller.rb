class Uw::RegisteredAddressesController < Uw::ApplicationController
  layout 'uw/dashboard'

  def show
    load_parent
    load_resource
    build_resource
  end

  def create
    build_resource
    authorize(@resource)
    result = Uw::RegisteredAddresses::Organizers::Create.call(registered_address: @resource)
    if result.success?
      redirect_to uw_coverholder_trading_location_addresses_path(coverholder_id: @resource.coverholder_id)
    else
      flash[:alert] = "Can't create new registered address"
      render 'show'
    end
  end

  def update
    load_resource
    authorize @resource
    result = Uw::RegisteredAddresses::Organizers::Update.call(registered_address: @resource, attributes: resource_params)
    if result.success?
      redirect_to uw_coverholder_trading_location_addresses_path(coverholder_id: @resource.coverholder_id)
    else
      flash[:alert] = "Can't update registered address"
      render 'show'
    end
  end

  private

  def load_resource
    load_parent
    @resource ||= @parent.registered_address
  end

  def build_resource
    load_parent
    @resource            ||= @parent.build_registered_address
    @resource.attributes = resource_params
  end

  def parent
    Coverholder.find(params[:coverholder_id])
  end
end
