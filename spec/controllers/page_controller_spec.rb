RSpec.describe PageController do
    describe "GET index" do
      it 'renders the index template' do
        get :home
        expect(response).to render_template(:home)
      end
    end
  end
