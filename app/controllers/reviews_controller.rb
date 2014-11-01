class ReviewsController < ApplicationController

	def create
		# @current_profile = Profile.find(params[:review][:profile_id])
		# @review = @current_profile.reviews.build(review_params)
		
		@review = Review.new(review_params)
		if @review.save
			flash[:success] = "Review created"
			redirect_to root_url
		else
			flash[:failure] = "Review can not be created"
			redirect_to root_url
		end
	end

	def destroy
		@review.destroy
		redirect_to root_url
	end

	private

	def review_params
		params.require(:review).permit(:comment, :rating, :user_id).
		merge(profile: profile_id)
	end
end

# def create
# 	@profile = Profile.find(params[:profile_id])
# 	@review = @profile.reviews.create(review_params)


