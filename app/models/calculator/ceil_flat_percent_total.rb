class Calculator::CeilFlatPercentTotal < Calculator
  preference :flat_percent, :decimal, :default => 0

  def self.description
    "Ceil Flat Percent Total"
  end

  def compute(object)
    return unless object.present? && object.line_items.present?
    item_total = object.line_items.map(&:amount).sum
    adjustment_total = object.adjustments.eligible.map(&:amount).sum
    total = item_total + adjustment_total
    value = total * self.preferred_flat_percent / 100.0
    value.ceil.to_f
  end
end
