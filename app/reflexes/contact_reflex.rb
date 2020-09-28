class ContactReflex < ApplicationReflex
  def destroy
    Contact.find(element.dataset[:id]).destroy
  end

  def new
    @contact = Contact.new(coverholder_id: element.dataset[:coverholder_id])
  end

  def edit
    @contact = Contact.find(element.dataset[:id])
  end

  def submit
    if element.dataset[:id]
      @contact = Contact.find(element.dataset[:id])
    else
      @contact = Coverholder.find(element.dataset[:coverholder_id]).contacts.build
    end
    @contact.assign_attributes(contact_params)
    @contact = nil if @contact.save
  end

  private

  def contact_params
    params.require(:contact).permit(:name, :email, :type)
  end
end