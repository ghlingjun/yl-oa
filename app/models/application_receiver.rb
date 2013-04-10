class ApplicationReceiver < ActiveRecord::Base
  belongs_to :receive_application, :class_name => "Application", :foreign_key => "application_id"
  belongs_to :receiver, :class_name => "User", :foreign_key => "user_id"

  include ActiveModel::Transitions
  state_machine do
    state :pending
    state :approved
    state :rejected

    event :approve do
      transitions :to=>:approved, :from=>:pending, :on_transition => [:generate_prompt_info, :generate_another_receiver_or_approve_application]
    end

    event :reject do
      transitions :to=>:rejected, :from=>:pending, :on_transition => [:generate_prompt_info, :reject_application]
    end
  end

  class << self
    def find_by_receiver_and_application(receiver, application)
      where("user_id = ? and application_id=?", receiver.id, application.id).first
    end
  end

  def update_attribute_wrap params
    approve! if pending? && params[:state] == "approved"
    reject! if pending? && params[:state] == "rejected"
    update_attributes params
  end

  private

    def generate_prompt_info
      info = ""
      info << receiver.real_name
      info << I18n.t('txt.generate_prompt_info')
#      info << receive_application.reason + " "
      info << " "
      info << I18n.t("activerecord.models.#{receive_application.class.to_s.underscore}")

      p = PromptMessage.create(:content => info)
      p.receivers << receive_application.sender
    end

    def reject_application
      receive_application.reject!
      # when i save application object, rails will generate a new application_receiver record,
      # and i don't know why, so i have to delete this
      ApplicationReceiver.last.delete
    end

    def generate_another_receiver_or_approve_application
      sender = self.receive_application.sender
      receiver = self.receiver
      if sender.level_differ(receiver) >= 2  || !receiver.parent
        receive_application.approve!
        ApplicationReceiver.last.delete
        return
      end
      application_receiver = ApplicationReceiver.new
      application_receiver.receiver = receiver.parent
      application_receiver.receive_application = self.receive_application
      application_receiver.save!
    end

end