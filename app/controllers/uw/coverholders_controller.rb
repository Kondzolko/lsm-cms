class Uw::CoverholdersController < Uw::ApplicationController
  layout 'uw/dashboard'

  def create
    build_resource
    authorize(@resource)
    result = Uw::Coverholders::Organizers::CreateCoverholder.call(coverholder: @resource)
    if result.success?
      redirect_to uw_root_path(coverholder: @resource)
    else
      flash[:alert] = "Can't create new coverholder"
      puts result.inspect
      render 'new'
    end
  end

  def update
    load_resource
    authorize @resource
    result = Uw::Coverholders::Organizers::UpdateCoverholder.call(coverholder: @resource, attributes: resource_params)
    if result.success?
      redirect_to uw_root_path(coverholder: @coverholder)
    else
      flash[:alert] = "Can't update coverholder"
      render 'edit'
    end
  end
end
