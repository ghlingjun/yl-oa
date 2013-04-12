class Application < ActiveRecord::Base
  has_attached_file :attachment_file

  belongs_to :sender, :class_name=>"User", :foreign_key=>"sender"

  has_many :application_receivers , :order=>:created_at, :dependent => :destroy do
    def reject
      where('state = ?', 'rejected')
    end
    def pending
      where('state = ?', 'pending')
    end
    def approve
      where('state = ?', 'approved')
    end
  end
  has_many :receivers,  :through => :application_receivers

  FINANCE_OPINION = {
      :approved => I18n.t("init_data.expense_application.finance_opinion.approved"),
      :rejected => I18n.t("init_data.expense_application.finance_opinion.rejected")
  }

  include ActiveModel::Transitions
  state_machine do
    state :pending
    state :approved
    state :rejected
    event :approve do
      transitions :to=>:approved, :from=>:pending
    end

    event :reject do
      transitions :to=>:rejected, :from=>:pending
    end

  end


  after_create :create_application_receiver_if_necessary

  before_create :approve_if_necessary


  def state_I18n
    return I18n.t "activerecord.state.application.#{state}"
  end

#  def get_receivers_opinion
#    user = sender
#    while(user.parent)
#      raise "ApplicationReceiver cannot found , it shouldn't be happened" if not a_receiver = ApplicationReceiver.find_by_receiver_and_application(user.parent, self)
#      return I18n.t("activerecord.state.application.pending") if a_receiver.pending?
#      return I18n.t("activerecord.state.application.rejected") if a_receiver.rejected?
#      break if sender.level_differ(user.parent) >= 2
#      user = user.parent
#    end
#    return I18n.t("activerecord.state.application.approved")
#  end

  private
    def create_application_receiver_if_necessary
      return if not self.sender.parent
      application_receiver = ApplicationReceiver.new
      application_receiver.receiver = self.sender.parent
      application_receiver.receive_application = self
      if not application_receiver.save
        errors.add(:receivers, I18n.t("activerecord.errors.application.create_receiver_error"))
      end
    end

    def approve_if_necessary
      if not self.sender.parent
        self.state = "approved"
      end
    end
end

