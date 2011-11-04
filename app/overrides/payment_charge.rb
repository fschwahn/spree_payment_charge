Deface::Override.new(:virtual_path  => "checkout/_payment",
                     :insert_after  => 'code[erb-loud]:contains("t(method.name, :scope => :payment_methods, :default => method.name)")',
                     :text          => " <% if method.calculator.present? && method.compute_amount(@order) > 0 %>(<%= number_to_currency(method.compute_amount(@order)) %>)<% end %>",
                     :name          => "add_payment_charge_info")

Deface::Override.new(:virtual_path  => "admin/payment_methods/_form",
                     :insert_after  => '[data-hook="payment_method"]',
                     :text          => "<br/><br/><div data-hook='admin_payment_method_form_calculator_fields'><% @calculators = PaymentMethod.calculators.sort_by(&:name) %><%= render 'admin/shared/calculator_fields', :f => f %></div>",
                     :name          => "add_calculator_to_admin")
