module Icras
  class ProductReflex < ApplicationReflex
    before_reflex do
      @icra = GlobalID::Locator.locate_signed(element.dataset.signed_id)
    end

    def add
      puts session[:icra][@icra.id]['products']
      session[:icra][@icra.id]['products'] << Product.new.attributes

      @products = session[:icra][@icra.id]['products'].map do |attributes|
        Product.new(attributes)
      end
      morph(
        "#products",
        ApplicationController.render(
          partial: "uw/icras/products",
          locals: {
            products: @products
          }
        )
      )
    end
  end
end