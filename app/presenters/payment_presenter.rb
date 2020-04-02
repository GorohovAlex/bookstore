class PaymentPresenter < Rectify::Presenter
  attribute :owner, Object
  attribute :card_form, CardForm

  def card_form
    @card_form || Card.find_or_initialize_by(order: owner)
  end
end