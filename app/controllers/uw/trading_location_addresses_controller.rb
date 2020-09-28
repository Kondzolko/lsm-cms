class Uw::TradingLocationAddressesController < Uw::ApplicationController
  layout 'uw/dashboard'

  def index
    load_resources
    build_resource
    authorize @resource
  end

  def create
    load_parent
    build_resource
    authorize(@resource)
    result = Uw::RegisteredAddresses::Organizers::Create.call(registered_address: @resource)
    if result.success?
      redirect_to uw_coverholder_trading_location_addresses_path(@parent)
    else
      flash[:alert] = "Can't create new trading location address"
      load_resources
      render 'index'
    end
  end

  def update
    load_resource
    authorize @resource
    result = Uw::RegisteredAddresses::Organizers::Update.call(registered_address: @resource, attributes: resource_params)
    if result.success?
      redirect_to uw_coverholder_path(@parent)
    else
      flash[:alert] = "Can't update trading location address"
      render 'edit'
    end
  end

  def destroy
    load_resource
    authorize @resource
    @resource.destroy
    redirect_to uw_coverholder_trading_location_addresses_path(@parent)
  end

  private

  def build_resource
    @resource            ||= TradingLocationAddress.new(coverholder: @parent)
    @resource.attributes = resource_params
  end

  def parent
    @parent = Coverholder.find(params[:coverholder_id])
  end
end
