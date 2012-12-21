module ReviewsApp
  class ReviewNormalizer
    def normalize(review_request)
      review = Review.new
      review.customer_first_name = review_request["first_name"]
      review.customer_last_name = review_request["last_name"]
      #review.department_id = Department.find_by_name(review_request["review_type"]).try("id)
      #review.store_id = Store.find_by_name(review_request["store"]).try("id)
      review.advisor_name = review_request["advisor"]
      review.customer_city = review_request["city"]
      review.customer_vehicle_year = review_request["year"]
      review.customer_vehicle_make = review_request["make"]
      review.customer_vehicle_model = review_request["mdl"]
      review.customer_email = review_request["email"] || review_request["work_email"]
      review.review_key = review_request["reviewkey"]
      review
    end

    class Review < Struct.new :customer_first_name,
                              :customer_last_name,
                              :advisor_name,
                              :customer_city,
                              :customer_vehicle_year,
                              :customer_vehicle_make,
                              :customer_vehicle_model,
                              :customer_email,
                              :review_key
      def to_hash
        Hash[*members.zip(values).flatten]
      end
    end
  end
end
