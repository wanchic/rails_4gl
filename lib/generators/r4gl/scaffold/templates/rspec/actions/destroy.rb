  describe 'DELETE :destroy' do
    before do
      <%= instances_name.singularize %> = <%= class_name %>.create! valid_attributes
      delete :destroy, {:id => <%= instances_name.singularize %>.to_param}, valid_session
    end

    it "redirects to the <%= instances_name %> list" do
      response.should redirect_to(<%= instances_name %>_url)
    end

    it "returns http success" do
      response.should be_success
    end

  end
