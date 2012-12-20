step "I start a review" do
  ReviewsApp::ReviewStarter.new(ui: @listener, gateway: @gateway).start_review(@request_params)
end

step ":type review parameters" do |type|
  @request_params = (type.downcase + '_review').to_sym
end

step "I should receive :message" do |message|
  @listener = double "UI"
  @listener.should_receive(message.to_sym)
  @gateway = double "Gateway", :exists? => (message == 'existing_review')
end
