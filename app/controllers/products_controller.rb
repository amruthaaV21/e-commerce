class ProductsController < ApplicationController

  before_action :logged_in_user, only: [:create, :destroy]
  before_action :admin_user,   only: :destroy

 def new
   # @user = User.find(params[:user])
    @product = Product.new
 end

 def create
    @user = User.find(params[:user_id])
    @product = @user.products.build(product_params)

    if @product.save
      flash[:success] = "product created!"
      redirect_to root_url
    else
      render 'static_pages/home'
    end
  end

  def edit
     @product = Product.find(params[:id])
  end

  def update
     @product = Product.find(params[:id])
    if @product.update_attributes(product_params)
     flash[:success] = "Product details updated"
     redirect_to current_user
    else
      render 'edit'
    end
  end

  def destroy
    Product.find(params[:id]).destroy
    flash[:success] = "Product deleted"
    redirect_to request.referrer || root_url
  end

  private

    def product_params
      params.require(:product).permit(:name, :category, :price, :quantity, :discount, :picture)
    end

   def correct_user
      @product = current_user.products.find_by(id: params[:id])
      redirect_to root_url if @product.nil?
    end

end
