  describe 'PUT :update' do
    context "with valid params" do
      before do
        @<%= instances_name.singularize %> =  FactoryGirl.create(:<%= instances_name.singularize %>)
        put :update, {:id => @<%= instances_name.singularize %>.to_param, :<%= instances_name.singularize %> => FactoryGirl.attributes_for(:<%= instances_name.singularize %>) }, valid_session
      end

      it "assigns the requested <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
        assigns(:<%= instances_name.singularize %>).should eq(@<%= instances_name.singularize %>)
      end

      it "redirects to the <%= instances_name.singularize %>" do
        response.should redirect_to(@<%= instances_name.singularize %>)
      end

    end

    context "with invalid params" do
      before do
        @<%= instances_name.singularize %> =  FactoryGirl.create(:<%= instances_name.singularize %>)
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        put :update, {:id => @<%= instances_name.singularize %>.to_param, :<%= instances_name.singularize %> => {} }, valid_session
      end

      it "assigns the <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
        assigns(:<%= instances_name.singularize %>).should eq(@<%= instances_name.singularize %>)
      end

      it "re-renders the :edit template" do
        response.should render_template("edit")
      end

      it "returns http success" do
        response.should be_success
      end

    end

  end
