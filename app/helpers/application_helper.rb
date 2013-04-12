module ApplicationHelper
  def flash_messages
    flash.map do |name, message|
      content_tag :p, message, :class => [:notice, name].uniq.join(' ')
    end.join.html_safe if flash.present?
  end

  def logged_in?
    !!@current_user
  end

  def get_has_many_model_list_name(obj, attrs, name)
    str = ""
    obj.send(attrs.to_sym).each do |x|
      str += x.send(name.to_sym) + ";"
    end
    str
  end

  def finance_opinion_for_select
    result = []
    Application::FINANCE_OPINION.each do |k, v|
      result << [v, k]
    end
    result
  end

end
