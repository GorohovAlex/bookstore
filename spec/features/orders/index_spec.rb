describe 'Orders page', type: :feature do
  let(:orders_page) { OrdersPage.new }
  let(:order_items_count) { rand(1..10) }
  let(:orders) { create_list :order, order_items_count, :with_random_finish_state }
  let(:current_user) { create(:user, :with_cart_items, orders: orders) }

  describe 'With authorizated user' do
    before do
      login_as(current_user, scope: :user)
      visit user_orders_path
    end

    describe 'Visit to page' do
      it 'Show orders table/grid' do
        expect(orders_page).to have_orders_items(count: current_user.orders.completed.count)
      end

      it 'Show filter' do
        expect(orders_page).to have_filter_select
      end
    end

    describe 'Open filter list' do
      it 'Show list' do
        orders_page.filter_select.click
        expect(orders_page).to have_filter_items(count: Order::FINISH_STATUSES.count)
      end
    end
  end
end
