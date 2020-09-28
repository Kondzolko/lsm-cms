class Uw::CoverholdersController < Uw::ApplicationController
  layout 'uw/dashboard'

  def create
    build_resource
    authorize(@resource)
    result = Uw::Coverholders::Organizers::CreateCoverholder.call(coverholder: @resource)
    if result.success?
      redirect_to uw_coverholder_registered_address_path(coverholder_id: @resource.id)
    else
      flash[:alert] = "Can't create new coverholder"
      render 'new'
    end
  end

  def update
    load_resource
    authorize @resource
    result = Uw::Coverholders::Organizers::UpdateCoverholder.call(coverholder: @resource, attributes: resource_params)
    if result.success?
      if @resource.registered_address
        redirect_to uw_coverholder_trading_location_addresses_path(coverholder_id: @resource.id)
      else
        redirect_to uw_coverholder_registered_address_path(coverholder_id: @resource.id)
      end
    else
      flash[:alert] = "Can't update coverholder"
      render 'edit'
    end
  end
end
