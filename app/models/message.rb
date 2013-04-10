class Message < ActiveRecord::Base
#  attr_accessible :content, :sender, :state, :sum, :type
  belongs_to :sender, :class_name=>"User", :foreign_key=>"sender"

  has_many :message_receivers
  has_many :receivers,  :through => :message_receivers

end
