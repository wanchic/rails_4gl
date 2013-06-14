  describe 'GET :new' do
    before do
      get :new, {}, valid_session
    end

    it "assigns a new <%= instances_name.singularize %> as @<%= instances_name.singularize %>" do
      assigns(:<%= instances_name.singularize %>).should be_a_new(<%= class_name %>)
    end

    it "returns http success" do
      response.should be_success
    end

  end
