require 'aw_form_for'
module AWFormFor
  module FormHelpers
    [:form_for, :fields_for].each do |method|
      define_method "aw_#{method}" do |record, *args, &block|
        options = args.extract_options!
        options[:builder] = AWFormFor::FormBuilder
        
        send method, record, *(args << options), &block
      end
    end
  end
  
end