module ReviewsApp
  class ReviewStarter
    def initialize(args)
      @ui = args.fetch(:ui)
      @gateway = args.fetch(:gateway)
      @validator = args.fetch(:validator, ReviewValidator.new)
      @normalizer = args.fetch(:normalizer, ReviewNormalizer.new)
    end

    def start_review(review_request)
      review = normalizer.normalize(review_request)
      return ui.invalid_review if !validator.valid?(review)
      return ui.existing_review if gateway.exists?(review)
      ui.start_review(review)
    end

    private
    attr_reader :ui, :validator, :normalizer, :gateway, :review
  end
end
