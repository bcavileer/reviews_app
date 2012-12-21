module ReviewsApp
  class ReviewValidator
    def valid? review
      return false unless review.advisor_name
      return false unless review.customer_first_name
      return false unless review.customer_last_name
      return false unless review.review_key
      #return false unless review.store
      #return false unless review.review_type
      true
    end
  end
end