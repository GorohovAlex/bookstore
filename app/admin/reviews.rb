# rubocop:disable Metrics/BlockLength
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
    column t('.date'), :created_at
    column :user
    column :status
    actions
  end

  action_item :view, only: :show do
    unless review.rejected?
      link_to t('.rejected'), admin_review_path(review, review: { status: :rejected }), method: :patch
    end
  end

  action_item :view, only: :show do
    unless review.approved?
      link_to t('.approved'), admin_review_path(review, review: { status: :approved }), method: :patch
    end
  end
end
# rubocop:enable Metrics/BlockLength
