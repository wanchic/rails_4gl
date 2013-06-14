    it "routes GET /<%= instances_name %> to <%= instances_name %>#index" do
      get("/<%= instances_name %>").should route_to("<%= instances_name %>#index")
    end
