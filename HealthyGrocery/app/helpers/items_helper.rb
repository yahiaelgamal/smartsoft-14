module ItemsHelper

	@rating = current_user.ratings.where(:item_id => params[:id]).to_a;


	def rating_ballot
    if @rating.any?
      @rating
    else
      current_user.ratings.new
    end
	end

	def current_member_rating
    if @rating.any?
        @rating.value
    else
        "N/A"
    end
	end

end
