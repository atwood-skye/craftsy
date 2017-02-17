class ReviewsController < ApplicationController
  def new
    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @user = User.find(current_user.id)
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new(:review_params)
    if @product.save
      redirect_to product_path(@product)
    else
      render :new
    end
  end

  private
  def review_params
    params.require(:review).permit(:content, :product_id)
  end
end
