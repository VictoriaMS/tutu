module WagonsHelper
  def sti_wagon_path(type = 'wagon', wagon = nil, action = nil)
    send "#{format_sti(action, type, wagon)}_path", wagon
  end

  def format_sti(action, type, wagon)
    action || wagon ? "#{format_action(action)}#{type.underscore}" : "#{type.underscore.pluralize}"
  end

  def format_action(action)
    action ? "#{action}_" : ''
  end
end
