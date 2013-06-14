    it "routes GET /<%= instances_name %>/new to <%= instances_name %>#new" do
      get("/<%= instances_name %>/new").should route_to("<%= instances_name %>#new")
    end
