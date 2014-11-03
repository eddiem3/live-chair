class API::V1::ReviewsController < ApplicationController
	before_filter :can_make_review, :only => [:create, :destroy]
	respond_to :json

	def create
		@current_profile = Profile.find(params[:review][:profile_id])
		@review = @current_profile.reviews.build(review_params)
		
		if @review.save
			render :status => 200,
					:json => { :success => true,
				:info => "Review posted",
				:data => { :review => @review}}
		else
			 render :status => :unprocessable_entity,
					:json => { :success => false,
				:info => {},
				:data => {} }
		end
	end


	def destroy
		@review.destroy
		render :status => 200,
			:json => { :success => true,
				:info => "Review deleted",
				:data => {} }
	end

	private

	def review_params
	    json_params = ActionController::Parameters.new( JSON.parse(request.body.read))
	    return json_params.require(:review).permit(:comment,:rating,:user_id)
	end

	def can_make_review
		return !current_user.barber
	end

end
