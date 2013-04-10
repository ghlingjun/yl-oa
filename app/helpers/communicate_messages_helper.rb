module CommunicateMessagesHelper
  def generate_receiver_detail_info(message)
    result = ""
    message.message_receivers.each do |message_receiver|
      state = I18n.t("views_communicate_message.#{message_receiver.state}")
      result += (message_receiver.receiver_real_name + ":" + state + "; ")
    end
    result
  end
end
