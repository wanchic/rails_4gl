    it "routes GET /<%= instances_name %>/1/edit to <%= instances_name %>#edit" do
      get("/<%= instances_name %>/1/edit").should route_to("<%= instances_name %>#edit", :id => "1")
    end
