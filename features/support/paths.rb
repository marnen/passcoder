module PathHelpers
  def path_to(page_name)
    case page_name
    when 'the home page'
      '/'
    when 'the login page'
      new_user_session_path
    when 'the passcode entry page'
      new_passcode_path
    when 'the passcode index page'
      passcodes_path
    else
      raise ArgumentError, "No mapping defined for '#{page_name}'. Please add one in #{__FILE__}."
    end
  end
end

World PathHelpers
