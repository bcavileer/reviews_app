require "spec_helper"

module ReviewsApp
  describe ReviewValidator do
    describe "validates reviews from unknown sources" do
      it "review is adp or autobase" do
        subject.valid?(:adp_review).should be_true
        subject.valid?(:autobase_review).should be_true
        subject.valid?(:existing_review).should be_true
      end

      it "review is unknown" do
        subject.valid?(:invalid_review).should be_false
      end
    end
  end
end
