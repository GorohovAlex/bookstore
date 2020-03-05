class ReviewsController < InheritedResources::Base

  def create
    respond_to do |format|
      @review = ReviewForm.new(review_params)
      if @review.save
        format.html { redirect_to book_path(@review.book_id), flash: { notice: t('.successful_message') } }
      else
        format.js { render 'books/show', status: :unprocessable_entity }
      end
    end
  end

  private

    def review_params
      params.require(:review_form).permit(:title, :review, :rating, :book_id).merge(user_id: current_user.id)
    end
end
