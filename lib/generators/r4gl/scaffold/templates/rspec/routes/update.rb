    it "routes PATCH /<%= instances_name %>/1 to instances_name %>#update" do
      patch("/<%= instances_name %>/1").should route_to("<%= instances_name %>#update", :id => "1")
    end
