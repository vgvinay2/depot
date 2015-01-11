class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]
  
  before_filter :authorize, :only => :create
  
  
  # GET /line_items
  # GET /line_items.json
  def index
    @line_items = LineItem.all
  end

  # GET /line_items/1
  # GET /line_items/1.json
  def show
  end

  # GET /line_items/new
  def new
    @line_item = LineItem.new
  end

  # GET /line_items/1/edit
  def edit
  end

  # POST /line_items
  # POST /line_items.json
  
  
  def create 
    # The default HTTP method for a link is a get, the default HTTP method for a button is a post, 
    # and Rails uses these conventions to
    # determine which method to call.
    # See the comments inside the app/controllers/
    # line_items_controller.rb file to see other conventions




   # LineItemsController to find the shopping cart for the current
   # session (creating one if there isn’t one there already), add the selected product
   # to that cart, and display the cart contents. 

    @cart = current_cart # define in application controller for saving the id of cart in the session
    product = Product.find(params[:product_id]) #product is a local variable
    @line_item = @cart.add_product(product.id)                 

    respond_to do |format|
      if @line_item.save
      debugger
        format.html { redirect_to(@cart) }

      else
        format.html { render :action => "new" }

      end

    end
  end

  # PATCH/PUT /line_items/1
  # PATCH/PUT /line_items/1.json
  def update
    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line item was successfully updated.' }

      else
        format.html { render action: 'edit' }

      end
    end
  end

  # DELETE /line_items/1
  # DELETE /line_items/1.json
  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url }

    end
  end

 
 

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def line_item_params
    params.require(:line_item).permit(:product_id, :cart_id)
  end
end
