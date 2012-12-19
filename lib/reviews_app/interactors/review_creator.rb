module ReviewsApp

  class Review
    attr_accessor :validator, :normalizer
    def initialize(review_request)
      @request = review_request
    end

    def valid?
      validator.valid?(@request)
    end

    def normalize
      normalizer.normalize(self)
    end
  end

  class ReviewCreator
    attr_accessor :ui, :validator, :normalizer, :gateway

    def start_review(review_request)
      review = Review.new(review_request)
      review.validator = validator
      review.normalizer = normalizer
      review.normalize

      return ui.invalid_review unless review.valid?
      return ui.existing_review if gateway.exists?(review)
      ui.start_review(review)
    end
  end
end