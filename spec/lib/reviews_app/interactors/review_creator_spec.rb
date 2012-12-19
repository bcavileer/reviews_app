require "spec_helper"

module ReviewsApp
  describe ReviewCreator do
    let(:ui){ double("UI") }
    let(:validator) { double("Validator", :valid? => true) }
    let(:normalizer) { double("Normalizer", :normalize => nil) }
    let(:gateway){ double("Gateway", :exists? => false) }

    before(:each) do
      subject.ui = ui
      subject.validator = validator
      subject.normalizer = normalizer
      subject.gateway = gateway
    end

    context "with valid review data" do
      it "responds to the UI with start_review" do
        ui.should_receive(:start_review)
        subject.start_review({})
      end
    end

    context "with invalid review data" do
      it "responds to the UI with invalid_review" do
        ui.should_receive(:invalid_review)
        validator.stub(:valid? => false)
        subject.start_review({})
      end
    end

    context "with review data that already exists" do
      it "responds to the UI with existing_review" do
        ui.should_receive(:existing_review)
        gateway.stub(:exists? => true)
        subject.start_review({})
      end
    end
  end
end