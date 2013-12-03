class User < ActiveRecord::Base
#  attr_accessible :name, :real_name, :email, :password, :password_confirmation

  Positions = {:staff => I18n.t("init_data.position.staff"),
        :manager => I18n.t("init_data.position.manager"),
        :department_manager => I18n.t("init_data.position.department_manager"),
        :vice_president => I18n.t("init_data.position.vice_president"),
        :president => I18n.t("init_data.position.president")}

  has_and_belongs_to_many :roles

  has_many :notices, :dependent => :destroy

  has_many :send_messages, :class_name=>"Message", :foreign_key=>"sender", :dependent => :destroy, :extend => MessageTypeFinder

  has_many :message_receivers, :dependent => :destroy
  has_many :receive_messages, :through => :message_receivers do
    def communicate_messages
      where('messages.type = ?', "CommunicateMessage")
    end
    def prompt_messages
      where('messages.type = ?', "PromptMessage")
    end
    def unread
      where('message_receivers.state = ?', "unread")
    end
  end

  has_many :send_applications, :class_name=>"Application", :foreign_key=>"sender", :dependent => :destroy, :extend => ApplicationTypeFinder

  has_many :application_receivers, :dependent => :destroy
  has_many :receive_applications, :through => :application_receivers do
    def pending
      where('application_receivers.state = ?', 'pending')
    end
  end

  has_many :work_logs do
    def filter_by_date(filter_date)
      if filter_date.nil?
        return self
      end
      where('log_date <= ? and log_date >= ?', filter_date.next_month, filter_date)
    end
  end

  has_many :use_car_registrations

  has_many :certification_applications

  scope :search_for_real_name, lambda{|q| {:conditions => ['name LIKE ? and name not in (?, ?)', "%#{q}%", "root", "operator"] }; }

  acts_as_tree :order=>:name, :dependent => :nullify

  attr_accessor :password_confirmation
  attr_reader :password

  class << self
    def authenticate(name, password)
      if user = find_by_name(name)
        if user.hashed_password == encrypt_password(password, user.salt)
          user
        end
      end
    end

    def encrypt_password(password, salt)
      Digest::SHA2.hexdigest(password + "wibble" + salt)
    end

    def find_ids_by_real_names(real_names)
      ids = []
      real_names.each do |real_name|
        u = User.find_by_real_name(real_name)
        ids << u.id   if (u)
      end
      ids
    end
  end

  validates :name, :presence => true, :uniqueness => true

  validates :real_name, :presence => true

  validates :password, :confirmation => true

  validate  :password_must_be_present

  after_destroy :ensure_an_admin_remains

  # 'password' is a virtual attribute
  def password=(password)
    @password = password

    if password.present?
      generate_salt
      self.hashed_password = self.class.encrypt_password(password, salt)
    end
  end

  def can?(action, resource)
    roles.includes(:rights).for(action, resource).any?
  end

  def ensure_an_admin_remains
    if User.count.zero?
      raise "Can't delete last user_module"
    end
  end

  def level_differ(another_user)
    level = 0
    user = self
    while(user.parent && user != another_user)
      user = user.parent
      level += 1
    end

    if user == another_user
      return level
    end
    raise "wrong agrument | current user is not child of the agrument"
  end

  def get_children_work_logs()
    ids = []
    ids += children.collect {|child| child.id}
    children.each do |child|
      ids += child.children.collect {|child_child| child_child.id}
    end
    WorkLog.where("user_id in (?)", ids)
  end

  private
    def password_must_be_present
      errors.add(:password, "Missing password") unless hashed_password.present?
    end

    def generate_salt
      self.salt = self.object_id.to_s + rand.to_s
    end
end
