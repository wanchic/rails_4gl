  describe 'DELETE :destroy' do
    it "redirects to the <%= instances_name %> list" do
      <%= instances_name.singularize %> = FactoryGirl.create(:<%= instances_name.singularize %>)
      delete :destroy, {:id => <%= instances_name.singularize %>.to_param}, valid_session
      response.should redirect_to(<%= instances_name %>_url)
    end

  end
