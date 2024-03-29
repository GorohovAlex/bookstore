describe 'Cart page', type: :feature do
  let(:cart_page)                 { CartPage.new }
  let(:catalog_page)              { CatalogPage.new }

  let(:checkout_email_login_page) { CheckoutEmailLoginPage.new }
  let(:current_user)              { create(:user) }
  let(:items_count)               { rand(2..50) }
  let(:coupon_enable)             { create(:coupon, :enable) }

  describe 'With authorizated user' do
    before do
      create_list(:cart_item, items_count, user_id: current_user.id)
      login_as(current_user, scope: :user)
      visit cart_items_path
    end

    describe 'Visit to cart page' do
      it 'Show cart items' do
        expect(cart_page).to have_cart_items
        expect(cart_page.cart_items).to all(be_all_there)
        expect(cart_page).to have_summary_sub_total
        expect(cart_page).to have_summary_coupon
        expect(cart_page).to have_summary_order_total
      end
    end

    describe 'Delete cart item' do
      let(:item_index) { rand(0...cart_page.cart_items.count) }

      it 'decrements the item count by 1' do
        expect do
          cart_page.cart_items[item_index].close.click
          sleep 1
        end.to change { cart_page.cart_items.count }.by(-1)
      end
    end

    describe 'Click to apply coupon' do
      it 'Change summary coupon value' do
        cart_page.coupon.name_input.set coupon_enable.name
        cart_page.coupon.submit.click
        sleep 1
        expect(cart_page.summary_coupon.text).to eq(humanized_money_with_symbol(-coupon_enable.discount))
      end
    end

    describe 'Click to plus quantity' do
      it 'increments the count by 1' do
        item_index = rand(0...cart_page.cart_items.count)
        item = cart_page.cart_items[item_index]
        expect do
          item.quantity.quantity_plus.click
          sleep 1
        end.to change { cart_page.cart_items[item_index].quantity.quantity_value.value.to_i }.by(1)
      end
    end

    describe 'Click to minus quantity' do
      it 'increments the quantity by 1' do
        item_index = rand(0...cart_page.cart_items.count)
        quantity_box = cart_page.cart_items[item_index].quantity
        quantity_box.quantity_value.set '2'
        quantity_box.quantity_minus.click
        sleep 1
        expect(cart_page.cart_items[item_index].quantity.quantity_value.value.to_i).to eq(1)
      end

      it 'thes quantity eq 1' do
        item_index = rand(0...cart_page.cart_items.count)
        quantity_box = cart_page.cart_items[item_index].quantity
        quantity_box.quantity_value.set '1'
        quantity_box.quantity_minus.click
        expect(cart_page.cart_items[item_index].quantity.quantity_value.value.to_i).to eq(1)
      end
    end

    describe 'Click `checkout` button' do
      it 'Open checkout page' do
        cart_page.checkout_button.click
        expect(page).to have_current_path(checkout_path, ignore_query: true)
      end
    end
  end

  describe 'With guest user' do
    before do
      create_list(:cart_item, items_count, session_id: page.get_rack_session['session_id'])
      visit cart_items_path
    end

    describe 'Click `checkout` button' do
      it 'Open quick registrate page' do
        cart_page.checkout_button.click
        expect(page).to have_current_path(checkout_email_login_path, ignore_query: true)
      end
    end
  end
end
