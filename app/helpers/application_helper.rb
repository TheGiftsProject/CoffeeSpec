module ApplicationHelper

  def class_if(klass, condition, option = {})
    option.merge!(:class => klass) if condition
    option
  end

  def form_error(field, option = {})
    class_if(:error, @drink.errors.include?(field), option)
  end

end
