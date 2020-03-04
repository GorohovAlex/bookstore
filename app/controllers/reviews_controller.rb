class ReviewsController < InheritedResources::Base

  private

    def review_params
      params.require(:review).permit(:title, :review, :rating)
    end

end
