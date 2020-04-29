class OrdersController < ApplicationController
  def index
    @orders = policy_scope(Order)
  end

  def show
    @order = policy_scope(Order).find_by!(id: params[:id])
    @presenter = Checkouts::CompletedPresenter.new(owner: @order)
  end
end
