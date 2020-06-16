class OrdersController < ApplicationController
  before_action :authorize_resource, only: %i[index show]

  def index
    @orders = policy_scope(Order).where(aasm_state: params[:filter] || Order::FINISH_DEFAULT_STATUS)
  end

  def show
    @order = policy_scope(Order).find_by!(id: params[:id])
    @presenter = Checkouts::CompletedPresenter.new(owner: @order)
  end

  def authorize_resource
    authorize Order
  end
end
