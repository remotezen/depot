class StoreController < ApplicationController
  include CurrentCart
  before_action :set_cart
  before_action :counter, only:[:index]
  skip_before_action :authorize
  include VisitCounter 
  def index
    @products = Product.order(:title)
  end
end
