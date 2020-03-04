class ReviewsController < InheritedResources::Base

  def create
    respond_to do |format|
      if ReviewForm.new(review_params).save
        format.html { redirect_to user_path, flash: { notice: t('.successful_message') } }
      else
        format.js { render :edit, status: :unprocessable_entity }
      end
    end
  end

  private

    def review_params
      params_full = params.require(:review).permit(:title, :review, :rating, :book_id)
      params_full[:user_id] = current_user.id
    end
end
