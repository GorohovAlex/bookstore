ActiveAdmin.register Order do
  permit_params :user_id, :aasm_state, :use_billing_address

  form do |f|
    f.semantic_errors
    f.inputs do
      f.input :user
      f.input :aasm_state, as: :select, collection: Order::FINISH_STATUSES
    end
    f.actions
  end
end
