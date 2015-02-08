class ReviewsController < ApplicationController
	before_filter :can_make_review, :only => [:create, :destroy]

	def create
		@current_profile = Profile.find(params[:review][:profile_id])
		@review = @current_profile.reviews.build(review_params)
		
		if @review.save
			flash[:success] = "Review created"
			redirect_to :back
		else
			flash[:failure] = "Review can not be created"
			redirect_to :back
		end
	end

	def destroy
		@review.destroy
		redirect_to root_url
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rating, :user_id)
	end

	def can_make_review
		return !current_user.barber
	end
end


