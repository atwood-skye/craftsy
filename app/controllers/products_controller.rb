class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      flash[:notice] = "Your product has been successfully added!"
      redirect_to :controller => 'home'
    else
      flash[:alert] = "There was an issue adding your product. Please try again."
      render :new
    end
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])
    if @product.update(product_params)
      redirect_to :controller => 'home'
    else
      render :edit
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    redirect_to :controller => 'home'
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
