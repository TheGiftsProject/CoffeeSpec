module ApplicationHelper

  def class_if(klass, condition)
    return {:class => klass} if condition
    {}
  end

  def form_error(field)
    class_if(:error, @drink.errors.include?(field))
  end
end
