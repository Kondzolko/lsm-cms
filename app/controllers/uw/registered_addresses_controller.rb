class Uw::RegisteredAddressesController < Uw::ApplicationController
  layout 'uw/dashboard'

  def create
    build_resource
    authorize(@resource)
    result = Uw::RegisteredAddresses::Organizers::Create.call(registered_address: @resource)
    if result.success?
      redirect_to uw_root_path(registered_address: @resource)
    else
      flash[:alert] = "Can't create new registered addresse"
      puts result.inspect
      render 'new'
    end
  end

  def update
    load_resource
    authorize @resource
    result = Uw::RegisteredAddresses::Organizers::Update.call(registered_address: @resource, attributes: resource_params)
    if result.success?
      redirect_to uw_root_path(registered_address: @coverholder)
    else
      flash[:alert] = "Can't update registered addresse"
      render 'edit'
    end
  end

  private

  def parent
    @parent = Coverholder.find(params[:coverholder_id])
  end
end
