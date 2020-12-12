class OrdersController < ApplicationController

# GET /customers
# GET /customers.json
def index
    @orders = Order.all
end


 # GET /orders/new
 def new
    @order = Order.new
  end

end
