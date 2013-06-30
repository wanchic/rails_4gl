  describe 'POST :create' do
    context "with valid params" do
      before do
        post :create, {:<%= instance_name %> => FactoryGirl.attributes_for(:<%= instance_name %>)}, valid_session
      end

      it "assigns a newly created <%= instance_name %> as @<%= instance_name %>" do
        assigns(:<%= instance_name %>).should be_a(<%= class_name %>)
        assigns(:<%= instance_name %>).should be_persisted
      end

      it "redirects to the created <%= instance_name %>" do
        response.should redirect_to(<%= class_name %>.last)
      end

    end

    context "with invalid params" do
      before do
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        #post :create, {:<%= instance_name %> => {} }, valid_session
        post :create, {:<%= instance_name %> => FactoryGirl.attributes_for(:<%= instance_name %>)}, valid_session
      end

      it "assigns a newly created but unsaved <%= instance_name %> as @<%= instance_name %>" do
        assigns(:<%= instance_name %>).should be_a_new(<%= class_name %>)
      end

      it "re-renders the :new template" do
        response.should render_template("new")
      end

      it "returns http success" do
        response.should be_success
      end

    end

  end
