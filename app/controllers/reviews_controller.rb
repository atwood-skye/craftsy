class ReviewsController < ApplicationController
  def new
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new
    else
      flash[:alert] = "Please sign in first!"
      redirect_to :controller => 'home'
    end
  end

  def create
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @review = @product.reviews.new(review_params)
      @review.user_id = current_user.id
      if @review.save
        flash[:notice] = "Your review was successfully added!"
        redirect_to product_path(@product)
      else
        flash[:alert] = 'Please try again!'
        render :new
      end
    else
      flash[:alert] = "Please sign in first!"
      redirect_to product_path(@product)
    end
  end

  def destroy
    if user_signed_in?
      @product = Product.find(params[:product_id])
      @review = Review.find(params[:id])
      if @review.destroy
        redirect_to product_path(@product)
      else
        flash[:alert] = 'Please try again'
        redirect_to product_path(@product)
      end
    end
  end

private
  def review_params
    params.require(:review).permit(:content, :product_id, :user_id)
  end
end
