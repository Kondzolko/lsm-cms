class TradingNameReflex < ApplicationReflex
  def destroy
    TradingName.find(element.dataset[:id]).destroy
  end

  def new
    @trading_name = TradingName.new(coverholder_id: element.dataset[:coverholder_id])
  end

  def edit
    @trading_name = TradingName.find(element.dataset[:id])
  end

  def submit
    if element.dataset[:id]
      @trading_name = TradingName.find(element.dataset[:id])
    else
      @trading_name = Coverholder.find(element.dataset[:coverholder_id]).trading_names.build
    end
    @trading_name.assign_attributes(permitted_params)
    @trading_name = nil if @trading_name.save
  end

  private

  def permitted_params
    params.require(:trading_name).permit(:name)
  end
end