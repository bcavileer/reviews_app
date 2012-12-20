require "spec_helper"

module ReviewsApp
  describe ReviewStarter do
    let(:ui_mock) { double("UI") }
    let(:gateway_stub) { double("Gateway", :exists? => false) }
    let(:validator_stub) { double("Validator", :valid? => true) }
    let(:normalizer_stub) { double("Normalizer", :normalize => nil) }
    let(:subject) do
      ReviewStarter.new ui: ui_mock,
                        gateway: gateway_stub,
                        validator: validator_stub,
                        normalizer: normalizer_stub
    end

    context "with valid review data" do
      it "responds to the UI with start_review" do
        ui_mock.should_receive(:start_review)
        subject.start_review({})
      end
    end

    context "with invalid review data" do
      it "responds to the UI with invalid_review" do
        ui_mock.should_receive(:invalid_review)
        validator_stub.stub(:valid? => false)
        subject.start_review({})
      end
    end

    context "with review data that already exists" do
      it "responds to the UI with existing_review" do
        ui_mock.should_receive(:existing_review)
        gateway_stub.stub(:exists? => true)
        subject.start_review({})
      end
    end
  end
end

