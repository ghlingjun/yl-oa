module MessageTypeFinder
  def communicate_messages
    where('type = ?', 'CommunicateMessage')
  end
  def prompt_messages
    where('type = ?', 'PromptMessage')
  end
end
