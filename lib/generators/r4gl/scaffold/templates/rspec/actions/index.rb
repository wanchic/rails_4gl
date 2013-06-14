  describe 'GET :index' do
    context "with 0 records" do
      it "returns http success" do
        get :index, {}, valid_session
        response.should be_success
      end

    end

    context "with 1 record" do
      it "returns http success" do
        <%= instances_name.singularize %> = FactoryGirl.create(:<%= instances_name.singularize %>)
        get :index, {}, valid_session
        response.should be_success
      end

    end

  end
