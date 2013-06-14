  describe 'POST :create' do
    context "with valid params" do
      before do
        post :create, {:<%= instances_name.singularize %> => valid_attributes}, valid_session
      end

      it "assigns a newly created <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
        assigns(:<%= instances_name.singularize %>).should be_a(<%= class_name %>)
        assigns(:<%= instances_name.singularize %>).should be_persisted
      end

      it "redirects to the created <%= instances_name.singularize %>" do
        response.should redirect_to(<%= class_name %>.last)
      end

      it "returns http success" do
        response.should be_success
      end

    end

    context "with invalid params" do
      before do
        <%= class_name %>.any_instance.stub(:save).and_return(false)
        post :create, {:<%= instances_name.singularize %> => {} }, valid_session
      end

      it "assigns a newly created but unsaved <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
        assigns(:<%= instances_name.singularize %>).should be_a_new(<%= class_name %>)
      end

      it "re-renders the :new template" do
        response.should render_template("new")
      end

      it "returns http success" do
        response.should be_success
      end

    end

  end
