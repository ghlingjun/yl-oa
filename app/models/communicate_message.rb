class CommunicateMessage < Message
  validates :content, :presence => true

  validates :receiver_ids, :presence => true

end