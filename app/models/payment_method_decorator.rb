PaymentMethod.class_eval do
  calculated_adjustments
  
  def create_adjustment_for(order)
    order.adjustments.where(:originator_type => "PaymentMethod").each { |a| a.destroy }
    if calculator.present?
      create_adjustment("Zahlungskosten (#{name})", order, order, true)
      order.update!
    end
  end
end
