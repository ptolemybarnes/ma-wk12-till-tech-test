module MyHelpers

  def reset setting_name
    new_object = settings.send(setting_name).class.new
    settings.send(((setting_name.to_s + '=').to_sym),new_object)
  end

  def add_to_utilities addition
    settings.utilities = settings.utilities.merge(addition)
  end


end

