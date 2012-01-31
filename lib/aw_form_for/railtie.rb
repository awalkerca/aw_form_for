require 'aw_form_for'

module AWFormFor
  class Railtie < Rails::Railtie
    initializer 'aw_form_for.initialize', :after => :after_initialize do
      ActionView::Base.send :include, AWFormFor::FormHelpers
    end
  end
end