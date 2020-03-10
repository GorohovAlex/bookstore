ActiveAdmin.register Review do
  includes :book, :user

  config.filters = false

  actions :index, :show, :update
  before_filter :skip_sidebar!

  permit_params :status

  scope :unprocessed, default: true
  scope :rejected
  scope :approved

  index do
    selectable_column
    column :book
    column :title
    column 'Date', :created_at
    column :user
    column :status
    actions
  end

  action_item :view, only: :show do
    link_to 'Rejected', admin_review_path(review, review: { status: :rejected }), method: :patch unless review.rejected?
  end

  action_item :view, only: :show do
    link_to 'Approved', admin_review_path(review, review: { status: :approved }), method: :patch unless review.approved?
  end

  # # if: proc { @current_scope.scope_method == :unprocessed }
  # batch_action :approve do |ids|
  #   reviews = Review.unprocessed.where(id: ids)
  #   reviews.any? ? reviews.each(&:approved!) : flash[:error] = 'admin.error'
  #   redirect_to(admin_reviews_path)
  # end
end
