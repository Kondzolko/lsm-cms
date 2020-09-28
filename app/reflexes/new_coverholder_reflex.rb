class NewCoverholderReflex < ApplicationReflex
  #TODO add pundit authorization
  def destroy_trading_location
    TradingLocationAddress.find(element.dataset[:id]).destroy
  end

  def new_trading_location
    @trading_location_address = TradingLocationAddress.new(coverholder_id: element.dataset[:coverholder_id])
  end

  def edit_trading_location
    @trading_location_address = TradingLocationAddress.find(element.dataset[:id])
  end

  def edit_registered_address
    @registered_address = RegisteredAddress.find(element.dataset[:id])
  end

  def create_trading_location
    coverholder = Coverholder.find(element.dataset[:coverholder_id])
    @trading_location_address = coverholder.trading_location_addresses.build(trading_location_params)
    @trading_location_address = nil if @trading_location_address.save
  end

  def submit_trading_location
    if element.dataset[:id]
      @trading_location_address = TradingLocationAddress.find(element.dataset[:id])
    else
      @trading_location_address = Coverholder.find(element.dataset[:coverholder_id]).trading_location_addresses.build
    end
    @trading_location_address.assign_attributes(trading_location_params)
    @trading_location_address = nil if @trading_location_address.save
  end

  def submit_registered_address
    @registered_address = RegisteredAddress.find(element.dataset[:id])
    @registered_address.assign_attributes(registered_address_params)
    @registered_address = nil if @registered_address.save
  end

  private

  def coverholder_params
    params.require(:coverholder).permit(:legal_entity_name)
  end

  def registered_address_params
    params.require(:registered_address).permit(:id, :country, :zip, :address_line_1, :address_line_2, :state, :city, :phone)
  end

  def trading_location_params
    params.require(:trading_location_address).permit(:id, :country, :zip, :address_line_1, :address_line_2, :state, :city, :phone)
  end
end