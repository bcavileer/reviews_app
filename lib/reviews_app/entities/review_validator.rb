module ReviewsApp
  class ReviewValidator
    def valid? review_request
      case review_request
        when :adp_review, :autobase_review, :existing_review
          true
        else
          false
      end
    end
  end
end