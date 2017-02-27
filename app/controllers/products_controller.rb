class ProductsController < ApplicationController

  def show
    @product = Product.find(params[:id])
      @reviews = @product.reviews.all
  end

  def new
    if current_user.admin?
      @product = Product.new
    else
      flash[:alert] = "You can't do that!"
      redirect_to :controller => 'home'
    end
  end

  def create
    if current_user.admin?
      @product = Product.new(product_params)
      if @product.save
        redirect_to :controller => 'home'
      else
        render :new
      end
    else
      flash[:alert] = "You don't have access to this"
      redirect_to :controller => 'home'
    end
  end

  def edit
    if current_user.admin?
      @product = Product.find(params[:id])
    else
      flash[:alert] = "You can't do that"
      redirect_to :controller => 'home'
    end
  end

  def update
    if current_user.admin?
      @product = Product.find(params[:id])
      if @product.update(product_params)
        redirect_to :controller => 'home'
    end
    else
      render :edit
    end
  end

  def destroy
    if current_user.admin?
      @product = Product.find(params[:id])
      if @product.destroy
        @product.reviews.each do |review|
          review.destroy
        end
      end
      redirect_to :controller => 'home'
    else
      render :show
    end
  end

private
  def product_params
    params.require(:product).permit(:name, :description, :price)
  end

end
