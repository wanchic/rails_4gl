  describe 'GET :edit' do
    before do
      <%= instances_name.singularize %> = <%= class_name %>.create! valid_attributes
      get :edit, {:id => <%= instances_name.singularize %>.to_param}, valid_session
    end

    it "assigns the requested <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
      assigns(:<%= instances_name.singularize %>).should eq(<%= instances_name.singularize %>)
    end

    it "returns http success" do
      response.should be_success
    end

  end
