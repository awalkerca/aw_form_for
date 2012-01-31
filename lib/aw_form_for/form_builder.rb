require 'aw_form_for'

module AWFormFor
  class FormBuilder < ActionView::Helpers::FormBuilder
    
    def submit(attribute, *args)
      options = args.extract_options!
      new_class = options[:class] || "button"
      super(attribute, *args << options.merge(:class=> new_class))
    end

    def collection_select(attribute, collection, *args)
      build_field attribute, *args do
        super(attribute, collection, *args)
      end
    end

    def collection_check_box(attribute, records, record_id, record_name, *args)
      build_field attribute,*args do
        @template.content_tag :ul, class: 'record_list' do
          records.map do |record|
            element_id = "#{object_name}_#{attribute}_#{record.send(record_id)}"
            checkbox = @template.check_box_tag("#{object_name}[#{attribute}][]",record.send(record_id), 
              object.send(attribute).include?(record.send(record_id)), id: element_id)
            @template.content_tag(:li, checkbox + " " + @template.label_tag(element_id, record.send(record_name)))
          end.join(" ").html_safe
        end
      end
    end

    %w[text_field text_area password_field email_field file_field check_box radio_button telephone_field phone_field 
        url_field email_field number_field].each do |field_type|
      define_method(field_type) do |attribute, *args|
        build_field attribute, *args do
          super(attribute, *args)
        end
      end
    end

    def error_messages(error_message, *args)
      options = args.extract_options!
      if object.errors.full_messages.any?
        @template.content_tag(:div, :id=> options[:container_id] || 'error_explanation', :class => options[:class]) do
          @template.content_tag(:h3,error_message) +
          @template.content_tag(:ul) do
            object.errors.map do |attr,msg|
              @template.content_tag :li, data: {source_field: "#{object_name}_#{attr}"} do "#{attr.to_s.titleize} #{msg}" end
            end.join.html_safe
          end
        end
      end
    end


    private

    def build_field(attribute,*args, &block)
      options = args.extract_options!
      container_classes = Set.new
      container_classes.add 'field'
      unless options[:container_class].blank?
        options[:container_class].split(" ").each do |cls|
          container_classes.add cls
        end
      end

      if (not options[:mark_validation] == false) and 
        (@object.class.validators_on(attribute).collect(&:class).include? ActiveModel::Validations::PresenceValidator)
          container_classes.add 'required'
      end


      @template.content_tag :div, :class => container_classes.to_a.join(' ') do 
        @template.content_tag(:label,(options[:label] || attribute.to_s.humanize), for: "#{@object_name}_#{attribute}") + 
        block.call(attribute,*args)
      end  
    end
  end
end #module