require 'action_view'

module AWFormFor
  autoload :FormBuilder, 'aw_form_for/form_builder'
  autoload :FormHelpers, 'aw_form_for/form_helpers'
  autoload :Railtie, 'aw_form_for/railtie'
  autoload :VERSION, 'aw_form_for/version'
end

AWFormFor::Railtie #trigger loading the railtie