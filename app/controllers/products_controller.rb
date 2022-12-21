# frozen_string_literal: true

class ProductsController < ApplicationController
  before_action :authenticate_user!

  def create
    Product.create(product_params)
  end

  private

    def product_params
      params.require(:product).permit(:name)
    end
end
