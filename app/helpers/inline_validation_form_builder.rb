class InlineValidationFormBuilder < ActionView::Helpers::FormBuilder

  def text_field(attribute, options={})
    super + inline_validation(object, attribute)
  end

  private
    # Creates inline validation errors.
    # @param model the model which contains the errors.
    # @param field the field on which you want to show the error.
    def inline_validation model, field
      return "" if model.errors[field].blank?

      errors = model.errors[field].join(', ')
      html = <<-HTML
        <div class="field_with_errors">
          <span class="help-inline">#{errors}</span>
        </div>
      HTML
      html.html_safe
    end
end