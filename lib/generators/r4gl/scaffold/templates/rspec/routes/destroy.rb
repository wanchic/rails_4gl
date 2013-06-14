    it "routes DELETE /<%= instances_name %>/1 to <%= instances_name %>#destroy" do
      delete("/<%= instances_name %>/1").should route_to("<%= instances_name %>#destroy", :id => "1")
    end
