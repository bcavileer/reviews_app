require "spec_helper"

module ReviewsApp
  describe ReviewValidator do
    describe "validates reviews from unknown sources" do
      it "review is adp or autobase" do
        subject.valid?(:adp).should be_true
        subject.valid?(:autobase).should be_true
        subject.valid?(:existing).should be_true
      end

      it "review is unknown" do
        subject.valid?(:invalid).should be_false
      end
    end
  end
end