    it "routes GET /<%= instances_name %>/1 to <%= instances_name %>#show" do
      get("/<%= instances_name %>/1").should route_to("<%= instances_name %>#show", :id => "1")
    end
