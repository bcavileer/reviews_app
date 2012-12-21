require "spec_helper"

module ReviewsApp
  describe ReviewValidator do
    describe "validates reviews from unknown sources" do
      let(:review) { double "Review",
                            :advisor_name => "Kurt Foster",
                            :customer_first_name => "Ben",
                            :customer_last_name => "Cavileer",
                            :review_key => "123456"
      }

      it "review is adp or autobase" do
        subject.valid?(review).should be_true
      end

      it "review is unknown" do
        review.stub :advisor_name => nil
        subject.valid?(review).should be_false
      end
    end
  end
end
