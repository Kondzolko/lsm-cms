class TradingLocationReflex < ApplicationReflex
    def destroy
      TradingLocationAddress.find(element.dataset[:id]).destroy
    end

    def new
      @trading_location = TradingLocationAddress.new(coverholder_id: element.dataset[:coverholder_id])
    end

    def edit
      @trading_location = TradingLocationAddress.find(element.dataset[:id])
    end

    def submit
      if element.dataset[:id]
        @trading_location = TradingLocationAddress.find(element.dataset[:id])
      else
        @trading_location = Coverholder.find(element.dataset[:coverholder_id]).trading_locations.build
      end
      @trading_location.assign_attributes(trading_location_params)
      @trading_location = nil if @trading_location.save
    end

    private

    def trading_location_params
      params.require(:trading_location).permit(:id, :country, :zip, :address_line_1, :address_line_2, :state, :city, :phone)
    end
  end