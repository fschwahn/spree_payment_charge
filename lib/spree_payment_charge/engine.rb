module SpreePaymentCharge
  class Engine < Rails::Engine
    engine_name 'spree_payment_charge'

    config.autoload_paths += %W(#{config.root}/lib)

    initializer "spree_payment_charge.register.calculators" do |app|
      app.config.spree.calculators.add_class('payment_methods')
      app.config.spree.calculators.payment_methods = [ Calculator::CeilFlatPercentTotal ]
    end

    # use rspec for tests
    config.generators do |g|
      g.test_framework :rspec
    end

    def self.activate
      Dir.glob(File.join(File.dirname(__FILE__), "../../app/**/*_decorator*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end

      Dir.glob(File.join(File.dirname(__FILE__), "../../app/overrides/*.rb")) do |c|
        Rails.application.config.cache_classes ? require(c) : load(c)
      end
    end
    
    config.to_prepare &method(:activate).to_proc
  end
end
