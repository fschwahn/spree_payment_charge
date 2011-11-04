Deface::Override.new(:virtual_path  => "checkout/_payment",
                     :insert_after => 'code[erb-loud]:contains("t(method.name, :scope => :payment_methods, :default => method.name)")',
                     :text          => " (<%= number_to_currency(method.compute_amount(@order)) %>)",
                     :name          => "add_payment_charge_info")
