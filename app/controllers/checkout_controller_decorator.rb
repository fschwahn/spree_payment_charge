CheckoutController.class_eval do
  before_filter :create_payment_charges
  
  private
    def create_payment_charges
      if request.get? && @order.present? && @order.confirm?
        @order.payment_method.create_adjustment_for(@order) if @order.payment_method
      end
    end
end