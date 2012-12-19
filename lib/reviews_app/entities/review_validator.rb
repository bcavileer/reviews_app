module ReviewsApp
  class ReviewValidator
    def valid?(review_request)
      case review_request
        when :adp, :autobase, :existing
          true
        else
          false
      end
    end
  end
end