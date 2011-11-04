CheckoutController.class_eval do
  private
    def before_confirm
      @order.payment_method.create_adjustment_for(@order) if @order.payment_method
    end
end