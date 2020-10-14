class Uw::DealsController < Uw::ApplicationController
  def overview
    load_resource
    authorize @resource
  end

  def general_info
    load_resource
    authorize @resource
    @deal_info ||= @resource.deal_info
  end

  def contract_details
    load_resource
    authorize @resource
  end

  def icra
    load_resource
    authorize @resource
    @icra ||= @resource.icra

    @products ||= @icra.products
    unless @stimulus_reflex
      session[:icra] ||= {}
      session[:icra][@icra.id] ||= {}
      session[:icra][@icra.id]['products'] = @products.map(&:attributes)
    end
  end

  def create
    build_resource
    authorize(@resource)
    result = Uw::Deals::Organizers::Create.call(deal: @resource, underwriter: current_underwriter)
    if result.success?
      redirect_to overview_uw_coverholder_deal_path(coverholder_id: @resource.coverholder_id, id: @resource.id)
    else
      flash[:alert] = "Can't create new deal"
      redirect_to uw_coverholder_path(@resource.coverholder)
    end
  end

  private

  def parent
    Coverholder.find(params[:coverholder_id])
  end
end
