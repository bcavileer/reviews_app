step "I start a review" do
  creator = ReviewsApp::ReviewCreator.new
  creator.ui = @listener
  creator.validator = ReviewsApp::ReviewValidator.new
  creator.normalizer = ReviewsApp::ReviewNormalizer.new
  creator.gateway = @gateway
  creator.start_review(@request_params)
end

step ":type review parameters" do |type|
  case type
  when "ADP"
      @request_params = :adp
    when "Autobase"
      @request_params = :autobase
    when "invalid"
      @request_params = :invalid
    when "existing"
      @request_params = :existing
  end
end

step "I should receive :message" do |message|
  @listener = double("UI")
  @listener.should_receive(message.to_sym)
  @gateway = double("Gateway", :exists? => (message == 'existing_review'))
end
