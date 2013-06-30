  describe 'PATCH :update' do
    context "with valid params" do
      before do
        @<%= instance_name %> =  FactoryGirl.create(:<%= instance_name %>)
        patch :update, {:id => @<%= instance_name %>.to_param, :<%= instance_name %> => FactoryGirl.attributes_for(:<%= instance_name %>) }, valid_session
      end

      it "assigns the requested <%= instance_name %> as @<%= instance_name %>" do
        assigns(:<%= instance_name %>).should eq(@<%= instance_name %>)
      end

      it "redirects to the <%= instance_name %>" do
        response.should redirect_to(@<%= instance_name %>)
      end

    end

    context "with invalid params" do
      before do
        @<%= instance_name %> =  FactoryGirl.create(:<%= instance_name %>)
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        #patch :update, {:id => @<%= instance_name %>.to_param, :<%= instance_name %> => {} }, valid_session
        patch :update, {:id => @<%= instance_name %>.to_param, :<%= instance_name %> => FactoryGirl.attributes_for(:<%= instance_name %>) }, valid_session
      end

      it "assigns the <%= instance_name %> as @<%= instance_name %>" do
        assigns(:<%= instance_name %>).should eq(@<%= instance_name %>)
      end

      it "re-renders the :edit template" do
        response.should render_template("edit")
      end

      it "returns http success" do
        response.should be_success
      end

    end

  end
