class ParticipatingUnderwriterReflex < ApplicationReflex
  def destroy
    ParticipatingUnderwriter.find(element.dataset[:id]).destroy
  end

  def new
    @participating_underwriter = ParticipatingUnderwriter.new
  end

  def submit
    @participating_underwriter = ParticipatingUnderwriter.new
    @participating_underwriter.assign_attributes(participating_underwriter_params)
    @participating_underwriter = nil if @participating_underwriter.save
  end

  private

  def participating_underwriter_params
    params.require(:participating_underwriter).permit(:underwriter_id, :deal_id)
  end
end