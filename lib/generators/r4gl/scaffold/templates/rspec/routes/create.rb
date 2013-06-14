    it "routes POST /<%= instances_name %> to <%= instances_name %>#create" do
      post("/<%= instances_name %>").should route_to("<%= instances_name %>#create")
    end
