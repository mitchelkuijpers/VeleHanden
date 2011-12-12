module DeviseHelper

  # fix the stupid messaging system of devise
  def devise_error_messages!
    unless resource.errors.nil?
      resource.errors.full_messages.collect {|message|
        '<div class="alert-message error">' + message + '</div>'
      }.join.html_safe
    end
  end
end