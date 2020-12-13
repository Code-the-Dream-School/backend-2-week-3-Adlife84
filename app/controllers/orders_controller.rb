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

# POST /customers
# POST /customers.json
def create
    @order = Order.new(order_params)
    if @order.save
        flash.notice = "The order record was created successfully."
        redirect_to @order
    else
        flash.now.alert = @order.errors.full_messages.to_sentence
        render :new  
    end
end

# GET /orders/1
# GET /orders/1.json
def show
    @order = Order.find(params[:id])
end


# GET /orders/1/edit
def edit
    @order = Order.find(params[:id])
end


# PATCH/PUT /orders/1
# PATCH/PUT /orders/1.json
def update
    @order = Order.find(params[:id]) # Get order from base by ID
    if @order.update(order_params)
        flash.notice = "The customer record was updated successfully."
        redirect_to @order
    else
        flash.now.alert = @order.errors.full_messages.to_sentence
        render :edit
    end
end

# DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order = Order.find(params[:id]) # Get order from base by ID
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

private
 # Only allow a list of trusted parameters through.
 def order_params
    params.require(:order).permit(:product_name, :product_count, :customer_id)
end


end
