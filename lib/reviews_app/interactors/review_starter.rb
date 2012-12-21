module ReviewsApp
  class ReviewStarter
    def initialize(args)
      @ui = args.fetch(:ui)
      @gateway = args.fetch(:gateway)
      @validator = args.fetch(:validator, ReviewValidator.new)
      @normalizer = args.fetch(:normalizer, ReviewNormalizer.new)
    end

    def start_review(review_request)
      review = normalizer.normalize review_request

      if !validator.valid? review
        ui.invalid_review
      elsif review_exists? review
        ui.existing_review find_review(review)
      else
        ui.start_review review
      end
    end

    private

    def review_exists?(review)
      gateway.exists? review.to_hash
    end

    def find_review(review)
      gateway.find_first_from_hash review.to_hash
    end

    attr_reader :ui, :validator, :normalizer, :gateway, :review
  end
end
