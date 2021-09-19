# frozen_string_literal: true

module ApplicationHelper
  def bootstrap_class_for_flash(type)
    case type
      when 'notice' then "alert-info"
      when 'success' then "alert-success"
      when 'error' then "alert-danger"
      when 'alert' then "alert-warning"
    end
  end

  def emoticon1_for_flash(type)
    case type
      when 'notice' then "🤓"
      when 'success' then "😍"
      when 'error' then ""
      when 'alert' then ""
    end
  end

  def emoticon2_for_flash(type)
    case type
      when 'notice' then "🧐"
      when 'success' then "💕"
      when 'error' then "😱"
      when 'alert' then "❗️"
    end
  end

  def is_user_coworking_manager?
    redirect_to root_path if !current_user&.is_coworking_manager?
  end

end
