step "I start a review" do
  ReviewsApp::ReviewStarter.new(ui: @listener, gateway: @gateway).start_review(@request_params)
end

step ":type review parameters" do |type|
  @request_params = case type.downcase.to_sym
                      when :adp
                        {"advisor"=>"Kurt Foster",
                         "first_name"=>"Ben",
                         "last_name"=>"Cavileer",
                         "review_type"=>"Service",
                         "reviewkey"=>"123456",
                         "store"=>"BMW of Mt Laurel",
                         }
                      when :autobase
                        {"advisor"=>"We",
                         "first_name"=>"Ben",
                         "last_name"=>"Cavileer",
                         "review_type"=>"Service",
                         "reviewkey"=>"123456",
                         "store"=>"Holman Infiniti",
                        }
                      when :invalid
                        {
                        }
                      when :existing
                        {"advisor"=>"Kurt Foster",
                         "first_name"=>"Ben",
                         "last_name"=>"Cavileer",
                         "review_type"=>"Sales",
                         "reviewkey"=>"123456",
                         "store"=>"BMW of Mt Laurel",
                        }
                    end
end

step "I should receive :message" do |message|
  @listener = double "UI"
  @listener.should_receive(message.to_sym)
  @gateway = double("Gateway", :exists? => (message == 'existing_review')).as_null_object
end

