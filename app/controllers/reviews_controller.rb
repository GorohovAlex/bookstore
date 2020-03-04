class ReviewsController < InheritedResources::Base

  def create
    ReviewForm.new(review_params).save
  end

  private

    def review_params
      params.require(:review).permit(:title, :review, :rating)
    end
end
